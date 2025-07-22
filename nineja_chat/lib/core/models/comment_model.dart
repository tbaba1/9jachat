import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String id;
  final String videoId;
  final String userId;
  final String username;
  final String userProfileImage;
  final bool isUserVerified;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likesCount;
  final int repliesCount;
  final List<String> likedBy;
  final String? parentCommentId; // For replies
  final bool isReply;
  final bool isPinned;
  final bool isReported;
  final List<String> reportedBy;
  final bool isBlocked;
  final String? blockReason;
  final List<String> mentions;

  CommentModel({
    required this.id,
    required this.videoId,
    required this.userId,
    required this.username,
    required this.userProfileImage,
    this.isUserVerified = false,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    this.likesCount = 0,
    this.repliesCount = 0,
    this.likedBy = const [],
    this.parentCommentId,
    this.isReply = false,
    this.isPinned = false,
    this.isReported = false,
    this.reportedBy = const [],
    this.isBlocked = false,
    this.blockReason,
    this.mentions = const [],
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? '',
      videoId: json['videoId'] ?? '',
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      userProfileImage: json['userProfileImage'] ?? '',
      isUserVerified: json['isUserVerified'] ?? false,
      text: json['text'] ?? '',
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      likesCount: json['likesCount'] ?? 0,
      repliesCount: json['repliesCount'] ?? 0,
      likedBy: List<String>.from(json['likedBy'] ?? []),
      parentCommentId: json['parentCommentId'],
      isReply: json['isReply'] ?? false,
      isPinned: json['isPinned'] ?? false,
      isReported: json['isReported'] ?? false,
      reportedBy: List<String>.from(json['reportedBy'] ?? []),
      isBlocked: json['isBlocked'] ?? false,
      blockReason: json['blockReason'],
      mentions: List<String>.from(json['mentions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'videoId': videoId,
      'userId': userId,
      'username': username,
      'userProfileImage': userProfileImage,
      'isUserVerified': isUserVerified,
      'text': text,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'likesCount': likesCount,
      'repliesCount': repliesCount,
      'likedBy': likedBy,
      'parentCommentId': parentCommentId,
      'isReply': isReply,
      'isPinned': isPinned,
      'isReported': isReported,
      'reportedBy': reportedBy,
      'isBlocked': isBlocked,
      'blockReason': blockReason,
      'mentions': mentions,
    };
  }

  CommentModel copyWith({
    String? id,
    String? videoId,
    String? userId,
    String? username,
    String? userProfileImage,
    bool? isUserVerified,
    String? text,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? likesCount,
    int? repliesCount,
    List<String>? likedBy,
    String? parentCommentId,
    bool? isReply,
    bool? isPinned,
    bool? isReported,
    List<String>? reportedBy,
    bool? isBlocked,
    String? blockReason,
    List<String>? mentions,
  }) {
    return CommentModel(
      id: id ?? this.id,
      videoId: videoId ?? this.videoId,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userProfileImage: userProfileImage ?? this.userProfileImage,
      isUserVerified: isUserVerified ?? this.isUserVerified,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      likesCount: likesCount ?? this.likesCount,
      repliesCount: repliesCount ?? this.repliesCount,
      likedBy: likedBy ?? this.likedBy,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      isReply: isReply ?? this.isReply,
      isPinned: isPinned ?? this.isPinned,
      isReported: isReported ?? this.isReported,
      reportedBy: reportedBy ?? this.reportedBy,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason ?? this.blockReason,
      mentions: mentions ?? this.mentions,
    );
  }

  bool get isLikedByUser => likedBy.isNotEmpty;

  @override
  String toString() {
    return 'CommentModel(id: $id, text: $text, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommentModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
