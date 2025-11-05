import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../app.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: BubblesBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                _SettingTile(
                  title: 'Change Password',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.changePassword),
                ),
                const SizedBox(height: 12),
                _SettingTile(
                  title: 'Language',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.language),
                ),
                const SizedBox(height: 12),
                _SettingTile(title: 'Mode', onTap: () {}),
                const Spacer(),
                PrimaryButton(
                  label: 'Log out',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.start,
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _SettingTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
    );
  }
}
