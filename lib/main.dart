import 'package:flutter/material.dart';
import 'theme.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
