import 'package:cloud_firestore/cloud_firestore.dart';

enum VideoType { normal, duet, stitch, reaction, live }

enum VideoPrivacy { public, private, friends, unlisted }

class VideoModel {
  final String id;
  final String userId;
  final String username;
  final String userProfileImage;
  final bool isUserVerified;
  final String videoUrl;
  final String? thumbnailUrl;
  final String caption;
  final List<String> hashtags;
  final List<String> mentions;
  final String? audioId;
  final String? audioName;
  final String? audioUrl;
  final int duration; // in seconds
  final int width;
  final int height;
  final double aspectRatio;
  final DateTime createdAt;
  final DateTime updatedAt;
  final VideoType type;
  final VideoPrivacy privacy;
  final bool isActive;
  final bool allowComments;
  final bool allowDuet;
  final bool allowStitch;
  final bool allowDownload;
  final int viewsCount;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final int savesCount;
  final List<String> likedBy;
  final List<String> savedBy;
  final String? location;
  final Map<String, dynamic>? effects;
  final Map<String, dynamic>? filters;
  final String? originalVideoId; // For duets and stitches
  final double? originalVideoStartTime; // For stitches
  final double? originalVideoEndTime; // For stitches
  final List<String> reportedBy;
  final bool isReported;
  final bool isBlocked;
  final String? blockReason;
  final Map<String, dynamic>? analytics;

  VideoModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.userProfileImage,
    this.isUserVerified = false,
    required this.videoUrl,
    this.thumbnailUrl,
    required this.caption,
    this.hashtags = const [],
    this.mentions = const [],
    this.audioId,
    this.audioName,
    this.audioUrl,
    required this.duration,
    required this.width,
    required this.height,
    required this.aspectRatio,
    required this.createdAt,
    required this.updatedAt,
    this.type = VideoType.normal,
    this.privacy = VideoPrivacy.public,
    this.isActive = true,
    this.allowComments = true,
    this.allowDuet = true,
    this.allowStitch = true,
    this.allowDownload = false,
    this.viewsCount = 0,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.savesCount = 0,
    this.likedBy = const [],
    this.savedBy = const [],
    this.location,
    this.effects,
    this.filters,
    this.originalVideoId,
    this.originalVideoStartTime,
    this.originalVideoEndTime,
    this.reportedBy = const [],
    this.isReported = false,
    this.isBlocked = false,
    this.blockReason,
    this.analytics,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      userProfileImage: json['userProfileImage'] ?? '',
      isUserVerified: json['isUserVerified'] ?? false,
      videoUrl: json['videoUrl'] ?? '',
      thumbnailUrl: json['thumbnailUrl'],
      caption: json['caption'] ?? '',
      hashtags: List<String>.from(json['hashtags'] ?? []),
      mentions: List<String>.from(json['mentions'] ?? []),
      audioId: json['audioId'],
      audioName: json['audioName'],
      audioUrl: json['audioUrl'],
      duration: json['duration'] ?? 0,
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      aspectRatio: (json['aspectRatio'] ?? 1.0).toDouble(),
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      type: VideoType.values.firstWhere(
        (e) => e.toString() == 'VideoType.${json['type']}',
        orElse: () => VideoType.normal,
      ),
      privacy: VideoPrivacy.values.firstWhere(
        (e) => e.toString() == 'VideoPrivacy.${json['privacy']}',
        orElse: () => VideoPrivacy.public,
      ),
      isActive: json['isActive'] ?? true,
      allowComments: json['allowComments'] ?? true,
      allowDuet: json['allowDuet'] ?? true,
      allowStitch: json['allowStitch'] ?? true,
      allowDownload: json['allowDownload'] ?? false,
      viewsCount: json['viewsCount'] ?? 0,
      likesCount: json['likesCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
      sharesCount: json['sharesCount'] ?? 0,
      savesCount: json['savesCount'] ?? 0,
      likedBy: List<String>.from(json['likedBy'] ?? []),
      savedBy: List<String>.from(json['savedBy'] ?? []),
      location: json['location'],
      effects: json['effects'],
      filters: json['filters'],
      originalVideoId: json['originalVideoId'],
      originalVideoStartTime: (json['originalVideoStartTime'])?.toDouble(),
      originalVideoEndTime: (json['originalVideoEndTime'])?.toDouble(),
      reportedBy: List<String>.from(json['reportedBy'] ?? []),
      isReported: json['isReported'] ?? false,
      isBlocked: json['isBlocked'] ?? false,
      blockReason: json['blockReason'],
      analytics: json['analytics'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'userProfileImage': userProfileImage,
      'isUserVerified': isUserVerified,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'caption': caption,
      'hashtags': hashtags,
      'mentions': mentions,
      'audioId': audioId,
      'audioName': audioName,
      'audioUrl': audioUrl,
      'duration': duration,
      'width': width,
      'height': height,
      'aspectRatio': aspectRatio,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'type': type.toString().split('.').last,
      'privacy': privacy.toString().split('.').last,
      'isActive': isActive,
      'allowComments': allowComments,
      'allowDuet': allowDuet,
      'allowStitch': allowStitch,
      'allowDownload': allowDownload,
      'viewsCount': viewsCount,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'sharesCount': sharesCount,
      'savesCount': savesCount,
      'likedBy': likedBy,
      'savedBy': savedBy,
      'location': location,
      'effects': effects,
      'filters': filters,
      'originalVideoId': originalVideoId,
      'originalVideoStartTime': originalVideoStartTime,
      'originalVideoEndTime': originalVideoEndTime,
      'reportedBy': reportedBy,
      'isReported': isReported,
      'isBlocked': isBlocked,
      'blockReason': blockReason,
      'analytics': analytics,
    };
  }

  VideoModel copyWith({
    String? id,
    String? userId,
    String? username,
    String? userProfileImage,
    bool? isUserVerified,
    String? videoUrl,
    String? thumbnailUrl,
    String? caption,
    List<String>? hashtags,
    List<String>? mentions,
    String? audioId,
    String? audioName,
    String? audioUrl,
    int? duration,
    int? width,
    int? height,
    double? aspectRatio,
    DateTime? createdAt,
    DateTime? updatedAt,
    VideoType? type,
    VideoPrivacy? privacy,
    bool? isActive,
    bool? allowComments,
    bool? allowDuet,
    bool? allowStitch,
    bool? allowDownload,
    int? viewsCount,
    int? likesCount,
    int? commentsCount,
    int? sharesCount,
    int? savesCount,
    List<String>? likedBy,
    List<String>? savedBy,
    String? location,
    Map<String, dynamic>? effects,
    Map<String, dynamic>? filters,
    String? originalVideoId,
    double? originalVideoStartTime,
    double? originalVideoEndTime,
    List<String>? reportedBy,
    bool? isReported,
    bool? isBlocked,
    String? blockReason,
    Map<String, dynamic>? analytics,
  }) {
    return VideoModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userProfileImage: userProfileImage ?? this.userProfileImage,
      isUserVerified: isUserVerified ?? this.isUserVerified,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      caption: caption ?? this.caption,
      hashtags: hashtags ?? this.hashtags,
      mentions: mentions ?? this.mentions,
      audioId: audioId ?? this.audioId,
      audioName: audioName ?? this.audioName,
      audioUrl: audioUrl ?? this.audioUrl,
      duration: duration ?? this.duration,
      width: width ?? this.width,
      height: height ?? this.height,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      type: type ?? this.type,
      privacy: privacy ?? this.privacy,
      isActive: isActive ?? this.isActive,
      allowComments: allowComments ?? this.allowComments,
      allowDuet: allowDuet ?? this.allowDuet,
      allowStitch: allowStitch ?? this.allowStitch,
      allowDownload: allowDownload ?? this.allowDownload,
      viewsCount: viewsCount ?? this.viewsCount,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      savesCount: savesCount ?? this.savesCount,
      likedBy: likedBy ?? this.likedBy,
      savedBy: savedBy ?? this.savedBy,
      location: location ?? this.location,
      effects: effects ?? this.effects,
      filters: filters ?? this.filters,
      originalVideoId: originalVideoId ?? this.originalVideoId,
      originalVideoStartTime: originalVideoStartTime ?? this.originalVideoStartTime,
      originalVideoEndTime: originalVideoEndTime ?? this.originalVideoEndTime,
      reportedBy: reportedBy ?? this.reportedBy,
      isReported: isReported ?? this.isReported,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason ?? this.blockReason,
      analytics: analytics ?? this.analytics,
    );
  }

  bool get isLikedByUser => likedBy.isNotEmpty;
  bool get isSavedByUser => savedBy.isNotEmpty;
  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  String toString() {
    return 'VideoModel(id: $id, userId: $userId, caption: $caption, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VideoModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
