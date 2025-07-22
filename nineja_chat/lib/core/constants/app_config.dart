class AppConfig {
  // App Information
  static const String appName = '9jaChat';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'A modern TikTok clone for all platforms';
  
  // Company Information
  static const String companyName = 'NinejaChat Inc.';
  static const String companyEmail = 'support@9jachat.com';
  static const String companyWebsite = 'https://9jachat.com';
  
  // Social Media Links
  static const String instagramUrl = 'https://instagram.com/9jachat';
  static const String twitterUrl = 'https://twitter.com/9jachat';
  static const String facebookUrl = 'https://facebook.com/9jachat';
  static const String youtubeUrl = 'https://youtube.com/c/9jachat';
  
  // App Store Links
  static const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.nineja.chat.nineja_chat';
  static const String appStoreUrl = 'https://apps.apple.com/app/9jachat/id123456789';
  
  // API Configuration
  static const String baseUrl = 'https://api.9jachat.com';
  static const String apiVersion = 'v1';
  static const String apiKey = 'your_api_key_here';
  
  // Video Configuration
  static const int maxVideoLengthSeconds = 180; // 3 minutes
  static const int minVideoLengthSeconds = 3;
  static const double maxVideoSizeMB = 100.0;
  static const List<String> supportedVideoFormats = ['mp4', 'mov', 'avi'];
  
  // Image Configuration
  static const double maxImageSizeMB = 10.0;
  static const List<String> supportedImageFormats = ['jpg', 'jpeg', 'png', 'gif'];
  
  // Audio Configuration
  static const int maxAudioLengthSeconds = 300; // 5 minutes
  static const double maxAudioSizeMB = 20.0;
  static const List<String> supportedAudioFormats = ['mp3', 'wav', 'aac'];
  
  // Chat Configuration
  static const int maxMessageLength = 1000;
  static const int maxMessagesPerMinute = 30;
  static const bool allowVoiceMessages = true;
  static const bool allowImageMessages = true;
  static const bool allowVideoMessages = true;
  
  // User Configuration
  static const int maxUsernameLength = 30;
  static const int minUsernameLength = 3;
  static const int maxBioLength = 150;
  static const int maxFollowingCount = 10000;
  
  // Content Moderation
  static const bool enableContentModeration = true;
  static const bool enableAutoModeration = true;
  static const List<String> bannedWords = [
    // Add inappropriate words here
  ];
  
  // Monetization
  static const bool enableTipping = true;
  static const bool enableAds = true;
  static const bool enablePremiumFeatures = true;
  static const double minTipAmount = 1.0;
  static const double maxTipAmount = 1000.0;
  
  // Features Toggle
  static const bool enableLiveStreaming = true;
  static const bool enableDuetMode = true;
  static const bool enableStitchMode = true;
  static const bool enableComments = true;
  static const bool enableSharing = true;
  static const bool enableDownloads = false;
  static const bool enableReactions = true;
  
  // Notification Configuration
  static const bool enablePushNotifications = true;
  static const bool enableInAppNotifications = true;
  static const bool enableEmailNotifications = true;
  
  // Privacy & Security
  static const bool enablePrivateProfiles = true;
  static const bool enableBlockedUsers = true;
  static const bool enableReportContent = true;
  static const int maxReportsPerDay = 10;
  
  // Analytics
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
  static const bool enablePerformanceMonitoring = true;
  
  // Development
  static const bool isDevelopment = true;
  static const bool enableDebugMode = true;
  static const bool enableTestMode = false;
}
