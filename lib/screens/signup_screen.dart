import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../app.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: SafeArea(
        child: BubblesBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Full Name'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: 'Create Account',
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, AppRoutes.home),
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
