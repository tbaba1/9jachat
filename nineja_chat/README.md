# 9jaChat - TikTok Clone

A modern, engaging, and full-featured TikTok clone built with Flutter and Firebase that works across all platforms (Android, iOS, Web).

## Features

### ✅ Implemented
- 🎨 Modern dark theme UI similar to TikTok
- 📱 Responsive design for all platforms
- 🔐 Authentication screens (Login/Signup ready for Firebase)
- 🏠 Home feed with vertical video scrolling
- 🔍 Discover screen with search and trending content
- 📤 Upload screen with camera/gallery options
- 💬 Messages screen with chat list
- 👤 Profile screen with user stats and content tabs
- 🎬 Video player widget with controls
- 🌍 Multi-platform support (Android, iOS, Web, Desktop)

### 🚧 Ready for Implementation
- 🔥 Firebase Authentication (Google, Apple, Phone, Email)
- 📹 Video upload and compression
- 💾 Cloud Firestore database
- 📱 Push notifications
- 🎵 Audio/Music integration
- 📊 Analytics and crash reporting
- �� Live streaming
- 💰 In-app monetization
- 🎭 Video effects and filters

## Getting Started

### Prerequisites
- Flutter SDK (3.19.6 or higher)
- Firebase project (for backend services)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd nineja_chat
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Firebase Setup (Optional but Recommended)

1. **Create a Firebase project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project
   - Enable Authentication, Firestore, Storage, and Cloud Messaging

2. **Add Firebase configuration**
   - Download `google-services.json` for Android
   - Download `GoogleService-Info.plist` for iOS
   - Get web config for Web platform
   - Place files in appropriate directories

3. **Initialize Firebase in the app**
   - Uncomment Firebase initialization in `lib/main.dart`
   - Add your Firebase configuration

### Project Structure

```
lib/
├── core/                   # Core functionality
│   ├── constants/         # App configuration and colors
│   ├── models/           # Data models
│   ├── services/         # Firebase and API services
│   ├── themes/           # App theme configuration
│   └── utils/            # Utilities and helpers
├── features/              # Feature modules
│   ├── auth/             # Authentication
│   ├── home/             # Home feed and main screen
│   ├── discover/         # Search and discovery
│   ├── upload/           # Video upload
│   ├── messaging/        # Chat and messaging
│   ├── profile/          # User profiles
│   ├── live/             # Live streaming
│   └── notifications/    # Push notifications
├── shared/               # Shared widgets and components
└── admin/                # Admin panel (Web)
```

## Configuration

### App Customization

Edit `lib/core/constants/app_config.dart` to customize:
- App name and branding
- Company information
- Feature toggles
- Video/image/audio limits
- Social media links
- Monetization settings

### Theme Customization

Edit `lib/core/constants/app_colors.dart` and `lib/core/themes/app_theme.dart` to customize:
- Color scheme
- Typography
- Component styles
- Dark/light themes

## Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Desktop
```bash
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## Features Overview

### 🔐 Authentication
- Email/Password login and signup
- Google Sign-In integration ready
- Apple Sign-In integration ready
- Phone number authentication ready
- Password reset functionality
- Email verification

### 🏠 Home Feed
- Vertical video scrolling (TikTok-style)
- Like, comment, share interactions
- Follow/Following feeds
- Infinite scroll loading
- Video controls and progress

### 🔍 Discover
- Search users, videos, sounds, hashtags
- Trending content tabs
- User suggestions
- Popular hashtags
- Featured sounds/music

### 📤 Upload
- Camera recording
- Gallery video selection
- Video editing tools ready
- Caption and hashtag support
- Privacy settings
- Upload progress tracking

### 💬 Messaging
- One-on-one chat
- Real-time messaging ready
- Message status indicators
- Online/offline status
- Media sharing ready

### 👤 Profile
- User statistics (followers, following, likes)
- Video grid display
- Profile editing
- Settings and preferences
- QR code sharing ready
- Analytics dashboard ready

## Admin Panel

The app includes a web-based admin panel for:
- User management
- Content moderation
- Analytics dashboard
- Firebase configuration
- App settings management

## Dependencies

Key packages used:
- `firebase_core` - Firebase integration
- `firebase_auth` - Authentication
- `cloud_firestore` - Database
- `firebase_storage` - File storage
- `video_player` - Video playback
- `camera` - Video recording
- `image_picker` - Media selection
- `get` - State management and routing
- `google_fonts` - Typography
- `lottie` - Animations

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## Support

For support and questions:
- Email: support@9jachat.com
- Documentation: [Link to docs]
- Issues: [GitHub Issues]

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Roadmap

### Phase 1 (Current)
- ✅ Basic UI implementation
- ✅ Navigation structure
- ✅ Theme system

### Phase 2 (Next)
- 🔥 Firebase integration
- 📹 Video upload/playback
- 🔐 Complete authentication
- 💬 Real-time messaging

### Phase 3 (Future)
- 🔴 Live streaming
- 🎵 Music integration
- 🎭 AR filters and effects
- 💰 Monetization features
- 📊 Advanced analytics

---

Built with ❤️ using Flutter and Firebase
