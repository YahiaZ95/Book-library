import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../models/book.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book?;

    if (book == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: const Center(child: Text('Book not found')),
      );
    }

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
                  child:
                      (book.imageUrl.isNotEmpty
                              ? Image.network(
                                  book.imageUrl,
                                  height: 220,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        height: 220,
                                        color: Colors.grey.shade600,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Book image',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Container(
                                          height: 220,
                                          color: Colors.grey.shade600,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                color: Colors.white70,
                                              ),
                                        );
                                      },
                                )
                              : Container(
                                  height: 220,
                                  color: Colors.grey.shade600,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.book,
                                    size: 80,
                                    color: Colors.white70,
                                  ),
                                ))
                          .animate()
                          .fadeIn(
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 100),
                          )
                          .slideY(
                            begin: 0.1,
                            end: 0,
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 100),
                          ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.author,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  label: 'Download book PDF',
                  onPressed: () async {
                    if (book.pdfUrl.isNotEmpty) {
                      final uri = Uri.parse(book.pdfUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cannot open PDF URL'),
                            ),
                          );
                        }
                      }
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('PDF URL not available'),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
