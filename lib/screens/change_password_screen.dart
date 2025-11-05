import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: SafeArea(
        child: BubblesBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextField(decoration: const InputDecoration(hintText: 'Old Password'), obscureText: true),
                const SizedBox(height: 12),
                TextField(decoration: const InputDecoration(hintText: 'New Password'), obscureText: true),
                const SizedBox(height: 12),
                TextField(decoration: const InputDecoration(hintText: 'Confirm Password'), obscureText: true),
                const SizedBox(height: 24),
                const PrimaryButton(label: 'Change'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


