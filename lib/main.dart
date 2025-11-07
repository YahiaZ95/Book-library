import 'package:flutter/material.dart';
import 'theme.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BookLibraryApp());
}

class BookLibraryApp extends StatelessWidget {
  const BookLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Library',
      theme: buildLightTheme(),
      initialRoute: AppRoutes.start,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
