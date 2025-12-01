import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/details_screen.dart';
import 'screens/change_password_screen.dart';
import 'screens/language_screen.dart';
import 'screens/downloaded_books_screen.dart';
import 'screens/add_book_screen.dart';

class AppRoutes {
  static const String start = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String details = '/details';
  static const String changePassword = '/change-password';
  static const String language = '/language';
  static const String downloads = '/downloads';
  static const String addBook = '/add-book';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.details:
        return MaterialPageRoute(
          builder: (_) => const DetailsScreen(),
          settings: settings,
        );
      case AppRoutes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case AppRoutes.language:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case AppRoutes.downloads:
        return MaterialPageRoute(builder: (_) => const DownloadedBooksScreen());
      case AppRoutes.addBook:
        return MaterialPageRoute(builder: (_) => const AddBookScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
