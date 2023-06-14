import 'dart:math';

import '../data/model/book.dart';
import '../data/model/rental.dart';
import '../data/model/user.dart';
import '../data/repository/book_repository/book_repository.dart';
import '../data/repository/rental_repository/rental_repository.dart';
import '../data/repository/user_repository/user_repository.dart';

import '../data/model/user.dart';

class BookModel {
  final UserRepository _userRepository;
  final BookRepository _bookRepository;
  final RentalRepository _rentalRepository;

  BookModel(this._userRepository, this._bookRepository, this._rentalRepository);

  Future<User> addUser(
    String name,
    int gender,
    DateTime signupDate,
    DateTime birthday,
    String phoneNumber,
    String address,
  ) async {
    final List<User> allUsers = await _userRepository.findAll();

    final int id = allUsers.fold(0, (max, e) => e.id > max ? e.id : max) + 1;

    final newUser =
        User(id, name, gender, signupDate, birthday, phoneNumber, address);

    _userRepository.insert(newUser);
    return newUser;
  }

  Future<Book> addBook(
    String title,
    String author,
    DateTime publicationDate,
  ) async {
    final List<Book> allBooks = await _bookRepository.findAll();

    final int id = allBooks.fold(0, (max, e) => e.id > max ? e.id : max) + 1;

    final newBook = Book(id, title, author, publicationDate);

    _bookRepository.insert(newBook);
    return newBook;
  }

  Future<void> rentBook(User user, Book book) async {
    final rental = Rental(book, user, DateTime.now());
    _rentalRepository.insert(rental);
  }
  
  Future<void> returnBook(Book book) async {
    _rentalRepository.delete(rental)
  }
}
