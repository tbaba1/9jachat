import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String? phoneNumber;
  final String displayName;
  final String? bio;
  final String? profileImageUrl;
  final String? coverImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isVerified;
  final bool isPrivate;
  final bool isActive;
  final int followersCount;
  final int followingCount;
  final int videosCount;
  final int likesCount;
  final List<String> interests;
  final String? location;
  final String? website;
  final DateTime? dateOfBirth;
  final String? gender;
  final Map<String, dynamic>? settings;
  final Map<String, dynamic>? socialLinks;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber,
    required this.displayName,
    this.bio,
    this.profileImageUrl,
    this.coverImageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.isVerified = false,
    this.isPrivate = false,
    this.isActive = true,
    this.followersCount = 0,
    this.followingCount = 0,
    this.videosCount = 0,
    this.likesCount = 0,
    this.interests = const [],
    this.location,
    this.website,
    this.dateOfBirth,
    this.gender,
    this.settings,
    this.socialLinks,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'] ?? '',
      bio: json['bio'],
      profileImageUrl: json['profileImageUrl'],
      coverImageUrl: json['coverImageUrl'],
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isVerified: json['isVerified'] ?? false,
      isPrivate: json['isPrivate'] ?? false,
      isActive: json['isActive'] ?? true,
      followersCount: json['followersCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      videosCount: json['videosCount'] ?? 0,
      likesCount: json['likesCount'] ?? 0,
      interests: List<String>.from(json['interests'] ?? []),
      location: json['location'],
      website: json['website'],
      dateOfBirth: (json['dateOfBirth'] as Timestamp?)?.toDate(),
      gender: json['gender'],
      settings: json['settings'],
      socialLinks: json['socialLinks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'coverImageUrl': coverImageUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'isVerified': isVerified,
      'isPrivate': isPrivate,
      'isActive': isActive,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'videosCount': videosCount,
      'likesCount': likesCount,
      'interests': interests,
      'location': location,
      'website': website,
      'dateOfBirth': dateOfBirth != null ? Timestamp.fromDate(dateOfBirth!) : null,
      'gender': gender,
      'settings': settings,
      'socialLinks': socialLinks,
    };
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? phoneNumber,
    String? displayName,
    String? bio,
    String? profileImageUrl,
    String? coverImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isVerified,
    bool? isPrivate,
    bool? isActive,
    int? followersCount,
    int? followingCount,
    int? videosCount,
    int? likesCount,
    List<String>? interests,
    String? location,
    String? website,
    DateTime? dateOfBirth,
    String? gender,
    Map<String, dynamic>? settings,
    Map<String, dynamic>? socialLinks,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isVerified: isVerified ?? this.isVerified,
      isPrivate: isPrivate ?? this.isPrivate,
      isActive: isActive ?? this.isActive,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      videosCount: videosCount ?? this.videosCount,
      likesCount: likesCount ?? this.likesCount,
      interests: interests ?? this.interests,
      location: location ?? this.location,
      website: website ?? this.website,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      settings: settings ?? this.settings,
      socialLinks: socialLinks ?? this.socialLinks,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
