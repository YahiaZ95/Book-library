import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../app.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BubblesBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    label: 'Log in',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.login),
                  ),
                  PrimaryButton(
                    label: 'Create Account',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signup),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
