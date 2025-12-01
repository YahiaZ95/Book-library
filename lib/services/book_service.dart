import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book.dart';

class BookService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'books';

  Stream<List<Book>> getBooks() {
    return _firestore
        .collection(_collectionName)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Book.fromFirestore(doc.data(), doc.id))
              .toList(),
        );
  }

  Future<Book?> getBookById(String bookId) async {
    try {
      final doc = await _firestore
          .collection(_collectionName)
          .doc(bookId)
          .get();
      if (doc.exists) {
        return Book.fromFirestore(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      print('Error getting book: $e');
      return null;
    }
  }

  Future<void> addBook(Book book) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(book.id)
          .set(book.toFirestore());
    } catch (e) {
      print('Error adding book: $e');
      rethrow;
    }
  }

  Future<void> updateBook(Book book) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(book.id)
          .update(book.toFirestore());
    } catch (e) {
      print('Error updating book: $e');
      rethrow;
    }
  }

  Future<void> deleteBook(String bookId) async {
    try {
      await _firestore.collection(_collectionName).doc(bookId).delete();
    } catch (e) {
      print('Error deleting book: $e');
      rethrow;
    }
  }
}
