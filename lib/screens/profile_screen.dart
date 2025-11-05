import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: BubblesBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextField(decoration: const InputDecoration(hintText: 'Name')),
                const SizedBox(height: 12),
                TextField(decoration: const InputDecoration(hintText: 'Email')),
                const SizedBox(height: 12),
                TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Downloaded Books',
                  ),
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.downloads),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        label: 'Delete account',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PrimaryButton(label: 'Edit', onPressed: () {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
