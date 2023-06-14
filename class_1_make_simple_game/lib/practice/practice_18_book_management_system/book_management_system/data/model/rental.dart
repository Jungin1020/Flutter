import 'book.dart';
import 'user.dart';

class Rental {
  Book book;
  User user;
  DateTime rentalDate;

  Rental(this.book, this.user, this.rentalDate);
}
