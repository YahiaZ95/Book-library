import 'package:flutter/material.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SafeArea(
        child: BubblesBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 220,
                    color: Colors.grey.shade600,
                    alignment: Alignment.center,
                    child: const Text(
                      'Book image',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Author Name'),
                      SizedBox(height: 8),
                      Text('Description'),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(label: 'Download book PDF', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
