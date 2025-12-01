class Book {
  final String id;
  final String author;
  final String description;
  final String imageUrl;
  final String pdfUrl;

  Book({
    required this.id,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.pdfUrl,
  });

  // إنشاء Book من Map (من Firebase)
  factory Book.fromFirestore(Map<String, dynamic> data, String id) {
    return Book(
      id: id,
      author: data['author'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      pdfUrl: data['pdfUrl'] ?? '',
    );
  }

  // تحويل Book إلى Map (لإرسال إلى Firebase)
  Map<String, dynamic> toFirestore() {
    return {
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
    };
  }
}

