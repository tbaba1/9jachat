import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF000000); // Black like TikTok
  static const Color primaryVariant = Color(0xFF1A1A1A);
  static const Color secondary = Color(0xFFFF0050); // Hot Pink/Red
  static const Color secondaryVariant = Color(0xFFE6004A);
  
  // Accent Colors
  static const Color accent = Color(0xFF00F5FF); // Cyan
  static const Color accentSecondary = Color(0xFF25F4EE); // Bright Cyan
  
  // Background Colors
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceVariant = Color(0xFF2D2D2D);
  
  // Text Colors
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF808080);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Social Media Colors
  static const Color google = Color(0xFFDB4437);
  static const Color apple = Color(0xFF000000);
  static const Color facebook = Color(0xFF4267B2);
  static const Color instagram = Color(0xFFE4405F);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color youtube = Color(0xFFFF0000);
  
  // Interactive Colors
  static const Color liked = Color(0xFFFF0050);
  static const Color shared = Color(0xFF25F4EE);
  static const Color commented = Color(0xFFFFFFFF);
  static const Color saved = Color(0xFFFFD700);
  
  // Chat Colors
  static const Color sentMessage = Color(0xFF25F4EE);
  static const Color receivedMessage = Color(0xFF2D2D2D);
  static const Color online = Color(0xFF4CAF50);
  static const Color offline = Color(0xFF808080);
  static const Color typing = Color(0xFFFF9800);
  
  // Video Player Colors
  static const Color playButton = Color(0xFFFFFFFF);
  static const Color progressBar = Color(0xFF25F4EE);
  static const Color progressBackground = Color(0xFF4A4A4A);
  static const Color volumeSlider = Color(0xFFFFFFFF);
  
  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);
  static const Color overlayDark = Color(0xB3000000);
  
  // Border Colors
  static const Color border = Color(0xFF4A4A4A);
  static const Color borderLight = Color(0xFF6A6A6A);
  static const Color borderDark = Color(0xFF2A2A2A);
  
  // Shimmer Colors
  static const Color shimmerBase = Color(0xFF2D2D2D);
  static const Color shimmerHighlight = Color(0xFF4A4A4A);
  
  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF000000),
    Color(0xFF1A1A1A),
  ];
  
  static const List<Color> accentGradient = [
    Color(0xFFFF0050),
    Color(0xFF25F4EE),
  ];
  
  static const List<Color> videoOverlayGradient = [
    Color(0x00000000),
    Color(0x80000000),
  ];
  
  // Helper methods
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
  
  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
  
  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
