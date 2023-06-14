import '../../model/book.dart';
import 'book_repository.dart';

class BookMemoryRepositoryImpl implements BookRepository {
  List<Book> _books = [];

  @override
  Future<List<Book>> findAll() async {
    return _books;
  }

  @override
  Future<Book?> findById(int id) async {
    if (_books.any((e) => e.id == id) == false) return null;
    return _books.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> insert(Book book) async {
    if (_books.contains(book)) {
      update(book);
    } else {
      _books.add(book);
    }
  }

  @override
  Future<void> update(Book book) async {
    _books = _books.map((e) {
      if (e.id == book.id) {
        return book;
      }
      return e;
    }).toList();
  }

  @override
  Future<void> delete(Book book) async {
    _books.remove(book);
  }
}
