# 9jaChat Setup Guide

## Quick Start

1. **Install Flutter** (if not already installed)
   ```bash
   # Download Flutter SDK
   # Add to PATH: export PATH="/path/to/flutter/bin:$PATH"
   ```

2. **Clone and Setup**
   ```bash
   git clone <repo-url>
   cd nineja_chat
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

## Firebase Setup (Complete Backend Integration)

### Step 1: Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project: "9jaChat"
3. Enable Google Analytics (optional)

### Step 2: Enable Firebase Services
1. **Authentication**
   - Go to Authentication > Sign-in method
   - Enable: Email/Password, Google, Apple, Phone
   - Set up OAuth consent screen

2. **Firestore Database**
   - Go to Firestore Database
   - Create database in production mode
   - Set up security rules

3. **Storage**
   - Go to Storage
   - Get started with default rules
   - Create folders: videos/, images/, audio/

4. **Cloud Messaging**
   - Go to Cloud Messaging
   - Generate server key for push notifications

### Step 3: Configure Flutter App

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   firebase login
   ```

2. **Configure FlutterFire**
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

3. **Update main.dart**
   Uncomment Firebase initialization code in `lib/main.dart`

### Step 4: Platform-Specific Setup

#### Android
1. Download `google-services.json`
2. Place in `android/app/`
3. Update `android/app/build.gradle`
4. Update `android/build.gradle`

#### iOS
1. Download `GoogleService-Info.plist`
2. Place in `ios/Runner/`
3. Update in Xcode project

#### Web
1. Copy Firebase config
2. Update `web/index.html`

## App Configuration

### Branding & Customization
Edit `lib/core/constants/app_config.dart`:
```dart
static const String appName = 'YourAppName';
static const String companyName = 'Your Company';
// ... other settings
```

### Theme Customization
Edit `lib/core/constants/app_colors.dart`:
```dart
static const Color primary = Color(0xFF000000);
static const Color secondary = Color(0xFFFF0050);
// ... other colors
```

### Feature Toggles
Enable/disable features in `app_config.dart`:
```dart
static const bool enableLiveStreaming = true;
static const bool enableTipping = true;
// ... other features
```

## Development Workflow

### 1. Code Structure
- Follow the established folder structure
- Use providers for state management
- Keep widgets small and reusable

### 2. Adding New Features
1. Create feature folder in `lib/features/`
2. Add screens, providers, and models
3. Update navigation routes
4. Add tests

### 3. Database Schema (Firestore)

#### Users Collection
```
users/{userId}
├── id: string
├── username: string
├── email: string
├── displayName: string
├── profileImageUrl: string
├── bio: string
├── isVerified: boolean
├── followers: array
├── following: array
├── createdAt: timestamp
└── settings: object
```

#### Videos Collection
```
videos/{videoId}
├── id: string
├── userId: string
├── videoUrl: string
├── thumbnailUrl: string
├── caption: string
├── hashtags: array
├── mentions: array
├── audioId: string
├── likesCount: number
├── commentsCount: number
├── sharesCount: number
├── viewsCount: number
├── createdAt: timestamp
└── privacy: string
```

#### Comments Collection
```
comments/{commentId}
├── id: string
├── videoId: string
├── userId: string
├── text: string
├── likesCount: number
├── parentCommentId: string (for replies)
├── createdAt: timestamp
└── mentions: array
```

### 4. Security Rules

#### Firestore Rules
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Videos are publicly readable, writable by owner
    match /videos/{videoId} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == resource.data.userId;
    }
    
    // Comments are publicly readable, writable by authenticated users
    match /comments/{commentId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

#### Storage Rules
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /videos/{userId}/{allPaths=**} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId;
    }
    
    match /images/{userId}/{allPaths=**} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## Building for Production

### Environment Setup
1. Create `.env` files for different environments
2. Set up staging and production Firebase projects
3. Configure CI/CD pipeline

### Android Release
```bash
# Generate keystore
keytool -genkey -v -keystore android/app/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Build release
flutter build appbundle --release
```

### iOS Release
```bash
# Build for App Store
flutter build ios --release
```

### Web Deployment
```bash
# Build for web
flutter build web --release

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

## Monetization Setup

### 1. AdMob Integration
1. Create AdMob account
2. Create ad units
3. Update `app_config.dart` with ad unit IDs
4. Implement ad widgets

### 2. In-App Purchases
1. Set up products in App Store Connect / Google Play Console
2. Implement purchase flow
3. Set up server-side receipt validation

### 3. Creator Fund
1. Set up Stripe/payment processing
2. Implement tipping system
3. Create creator payout system

## Analytics & Monitoring

### Firebase Analytics
- Track user engagement
- Monitor app performance
- Set up custom events

### Crashlytics
- Monitor app crashes
- Track non-fatal errors
- Set up alert notifications

### Performance Monitoring
- Track app startup time
- Monitor network requests
- Optimize video loading

## Maintenance

### Regular Updates
- Update dependencies monthly
- Review and update Firebase rules
- Monitor user feedback and analytics
- Plan feature updates based on usage data

### Security
- Regular security audits
- Update authentication flows
- Review user-generated content policies
- Monitor for spam and abuse

## Support

For technical support:
- Check documentation in `/docs`
- Review GitHub issues
- Contact: tech@9jachat.com
