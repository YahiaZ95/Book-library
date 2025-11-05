import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selected = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: SafeArea(
        child: BubblesBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                _langTile('English'),
                const SizedBox(height: 12),
                _langTile('Arabic'),
                const Spacer(),
                const PrimaryButton(label: 'Change'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _langTile(String name) {
    final selected = _selected == name;
    return InkWell(
      onTap: () => setState(() => _selected = name),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
          border: selected ? Border.all(color: Colors.black54) : null,
        ),
        alignment: Alignment.centerLeft,
        child: Text(name),
      ),
    );
  }
}
