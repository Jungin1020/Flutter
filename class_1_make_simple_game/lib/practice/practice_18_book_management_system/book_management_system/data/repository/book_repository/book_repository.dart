import '../../model/book.dart';

abstract interface class BookRepository {
  Future<void> insert(Book book);
  Future<void> update(Book book);
  Future<void> delete(Book book);
  Future<List<Book>> findAll();
  Future<Book?> findById(int id);
}
