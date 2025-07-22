import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../utils/logger.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;
  
  // Get current user stream
  static Stream<User?> get userChanges => _auth.userChanges();

  // Sign up with email and password
  static Future<UserCredential?> signUpWithEmailPassword({
    required String email,
    required String password,
    required String username,
    required String displayName,
  }) async {
    try {
      // Check if username is already taken
      final usernameExists = await _checkUsernameExists(username);
      if (usernameExists) {
        throw Exception('Username is already taken');
      }

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // Create user profile in Firestore
        await _createUserProfile(
          user: credential.user!,
          username: username,
          displayName: displayName,
        );

        // Send email verification
        await credential.user!.sendEmailVerification();
      }

      return credential;
    } on FirebaseAuthException catch (e) {
      AppLogger.error('SignUp error: ${e.message}');
      rethrow;
    } catch (e) {
      AppLogger.error('SignUp error: $e');
      rethrow;
    }
  }

  // Sign in with email and password
  static Future<UserCredential?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      AppLogger.error('SignIn error: ${e.message}');
      rethrow;
    }
  }

  // Sign in with Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      
      if (userCredential.user != null) {
        // Check if user profile exists, if not create one
        final userDoc = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
            
        if (!userDoc.exists) {
          await _createUserProfile(
            user: userCredential.user!,
            username: await _generateUniqueUsername(googleUser.displayName ?? ''),
            displayName: googleUser.displayName ?? '',
          );
        }
      }

      return userCredential;
    } catch (e) {
      AppLogger.error('Google SignIn error: $e');
      rethrow;
    }
  }

  // Sign in with Apple
  static Future<UserCredential?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);
      
      if (userCredential.user != null) {
        // Check if user profile exists, if not create one
        final userDoc = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
            
        if (!userDoc.exists) {
          final displayName = appleCredential.givenName != null && appleCredential.familyName != null
              ? '${appleCredential.givenName} ${appleCredential.familyName}'
              : userCredential.user!.email?.split('@').first ?? '';
              
          await _createUserProfile(
            user: userCredential.user!,
            username: await _generateUniqueUsername(displayName),
            displayName: displayName,
          );
        }
      }

      return userCredential;
    } catch (e) {
      AppLogger.error('Apple SignIn error: $e');
      rethrow;
    }
  }

  // Sign in with phone number
  static Future<void> signInWithPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
    required Function(String error) errorCallback,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          errorCallback(e.message ?? 'Phone verification failed');
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSentCallback(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      AppLogger.error('Phone SignIn error: $e');
      errorCallback(e.toString());
    }
  }

  // Verify phone OTP
  static Future<UserCredential?> verifyPhoneOTP({
    required String verificationId,
    required String otp,
    String? username,
    String? displayName,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      
      if (userCredential.user != null) {
        // Check if user profile exists, if not create one
        final userDoc = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
            
        if (!userDoc.exists) {
          await _createUserProfile(
            user: userCredential.user!,
            username: username ?? await _generateUniqueUsername('user'),
            displayName: displayName ?? '',
          );
        }
      }

      return userCredential;
    } catch (e) {
      AppLogger.error('OTP verification error: $e');
      rethrow;
    }
  }

  // Send password reset email
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      AppLogger.error('Password reset error: ${e.message}');
      rethrow;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      AppLogger.error('SignOut error: $e');
      rethrow;
    }
  }

  // Delete account
  static Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // Delete user data from Firestore
        await _firestore.collection('users').doc(user.uid).delete();
        
        // Delete user account
        await user.delete();
      }
    } catch (e) {
      AppLogger.error('Delete account error: $e');
      rethrow;
    }
  }

  // Check if username exists
  static Future<bool> _checkUsernameExists(String username) async {
    try {
      final query = await _firestore
          .collection('users')
          .where('username', isEqualTo: username.toLowerCase())
          .limit(1)
          .get();
      return query.docs.isNotEmpty;
    } catch (e) {
      AppLogger.error('Check username error: $e');
      return false;
    }
  }

  // Generate unique username
  static Future<String> _generateUniqueUsername(String baseName) async {
    String username = baseName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9_]'), '');
    if (username.isEmpty) username = 'user';
    
    String finalUsername = username;
    int counter = 1;
    
    while (await _checkUsernameExists(finalUsername)) {
      finalUsername = '${username}_$counter';
      counter++;
    }
    
    return finalUsername;
  }

  // Create user profile in Firestore
  static Future<void> _createUserProfile({
    required User user,
    required String username,
    required String displayName,
  }) async {
    try {
      final userModel = UserModel(
        id: user.uid,
        username: username.toLowerCase(),
        email: user.email ?? '',
        phoneNumber: user.phoneNumber,
        displayName: displayName,
        profileImageUrl: user.photoURL,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());
          
      AppLogger.info('User profile created: ${user.uid}');
    } catch (e) {
      AppLogger.error('Create user profile error: $e');
      rethrow;
    }
  }

  // Get user profile
  static Future<UserModel?> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      AppLogger.error('Get user profile error: $e');
      return null;
    }
  }

  // Update user profile
  static Future<void> updateUserProfile(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.id)
          .update(user.toJson());
    } catch (e) {
      AppLogger.error('Update user profile error: $e');
      rethrow;
    }
  }

  // Check if user is verified
  static bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;
  
  // Send email verification
  static Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      AppLogger.error('Send email verification error: $e');
      rethrow;
    }
  }
}
