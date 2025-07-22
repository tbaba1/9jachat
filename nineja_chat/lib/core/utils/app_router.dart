import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/auth/screens/phone_auth_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/home/screens/main_screen.dart';
import '../../features/home/screens/home_feed_screen.dart';
import '../../features/discover/screens/discover_screen.dart';
import '../../features/upload/screens/upload_screen.dart';
import '../../features/messaging/screens/messages_screen.dart';
import '../../features/messaging/screens/chat_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/settings_screen.dart';
import '../../features/live/screens/live_screen.dart';
import '../../features/notifications/screens/notifications_screen.dart';
import '../../shared/widgets/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    // Splash Route
    AutoRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
    ),
    
    // Onboarding Route
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
    ),
    
    // Auth Routes
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: SignupRoute.page,
      path: '/signup',
    ),
    AutoRoute(
      page: ForgotPasswordRoute.page,
      path: '/forgot-password',
    ),
    AutoRoute(
      page: PhoneAuthRoute.page,
      path: '/phone-auth',
    ),
    
    // Main App Routes
    AutoRoute(
      page: MainRoute.page,
      path: '/main',
      children: [
        AutoRoute(
          page: HomeFeedRoute.page,
          path: '/home',
          initial: true,
        ),
        AutoRoute(
          page: DiscoverRoute.page,
          path: '/discover',
        ),
        AutoRoute(
          page: UploadRoute.page,
          path: '/upload',
        ),
        AutoRoute(
          page: MessagesRoute.page,
          path: '/messages',
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: '/profile',
        ),
      ],
    ),
    
    // Individual Routes
    AutoRoute(
      page: ChatRoute.page,
      path: '/chat/:chatId',
    ),
    AutoRoute(
      page: EditProfileRoute.page,
      path: '/edit-profile',
    ),
    AutoRoute(
      page: SettingsRoute.page,
      path: '/settings',
    ),
    AutoRoute(
      page: LiveRoute.page,
      path: '/live/:videoId',
    ),
    AutoRoute(
      page: NotificationsRoute.page,
      path: '/notifications',
    ),
  ];
}

// Route Pages
@RoutePage()
class SplashRoute extends StatelessWidget {
  const SplashRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

@RoutePage()
class OnboardingRoute extends StatelessWidget {
  const OnboardingRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}

@RoutePage()
class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

@RoutePage()
class SignupRoute extends StatelessWidget {
  const SignupRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupScreen();
  }
}

@RoutePage()
class ForgotPasswordRoute extends StatelessWidget {
  const ForgotPasswordRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordScreen();
  }
}

@RoutePage()
class PhoneAuthRoute extends StatelessWidget {
  const PhoneAuthRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PhoneAuthScreen();
  }
}

@RoutePage()
class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}

@RoutePage()
class HomeFeedRoute extends StatelessWidget {
  const HomeFeedRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeFeedScreen();
  }
}

@RoutePage()
class DiscoverRoute extends StatelessWidget {
  const DiscoverRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DiscoverScreen();
  }
}

@RoutePage()
class UploadRoute extends StatelessWidget {
  const UploadRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UploadScreen();
  }
}

@RoutePage()
class MessagesRoute extends StatelessWidget {
  const MessagesRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MessagesScreen();
  }
}

@RoutePage()
class ProfileRoute extends StatelessWidget {
  final String? userId;
  const ProfileRoute({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(userId: userId);
  }
}

@RoutePage()
class ChatRoute extends StatelessWidget {
  final String chatId;
  const ChatRoute({Key? key, required this.chatId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatScreen(chatId: chatId);
  }
}

@RoutePage()
class EditProfileRoute extends StatelessWidget {
  const EditProfileRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EditProfileScreen();
  }
}

@RoutePage()
class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingsScreen();
  }
}

@RoutePage()
class LiveRoute extends StatelessWidget {
  final String videoId;
  const LiveRoute({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveScreen(videoId: videoId);
  }
}

@RoutePage()
class NotificationsRoute extends StatelessWidget {
  const NotificationsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotificationsScreen();
  }
}
