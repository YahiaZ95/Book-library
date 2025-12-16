import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/background_bubbles.dart';
import '../app.dart';
import '../models/book.dart';
import '../services/book_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookService = BookService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
          ),
        ],
      ),
      body: SafeArea(
        child: BubblesBackground(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: StreamBuilder<List<Book>>(
                    stream: bookService.getBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No books available'));
                      }

                      final books = snapshot.data!;

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return BookCard(
                            book: books[index],
                            index: index,
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.details,
                              arguments: books[index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addBook);
        },
        child: const Icon(Icons.add),
        tooltip: 'Add New Book',
      ),
    );
  }
}

class BookCard extends StatefulWidget {
  final Book book;
  final int index;
  final VoidCallback onTap;

  const BookCard({
    required this.book,
    required this.index,
    required this.onTap,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    // تأخير بسيط حسب الـ index لكل بطاقة
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) {
        setState(() {
          _animate = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: (_animate
                  ? (widget.book.imageUrl.isNotEmpty
                            ? Image.network(
                                widget.book.imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                color: Colors.grey.shade700,
                                child: const Icon(
                                  Icons.book,
                                  color: Colors.white70,
                                ),
                              ))
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.1, end: 0, duration: 600.ms)
                  : (widget.book.imageUrl.isNotEmpty
                        ? Image.network(widget.book.imageUrl, fit: BoxFit.cover)
                        : Container(
                            color: Colors.grey.shade700,
                            child: const Icon(
                              Icons.book,
                              color: Colors.white70,
                            ),
                          ))),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.book.author,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Read Book',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
