import '../../../data/model/rental.dart';
import '../../../data/repository/rental_repository/rental_repository.dart';

class RentalMemoryRepositoryImpl implements RentalRepository {
  List<Rental> _rentals = [];

  @override
  Future<List<Rental>> findAll() async {
    return _rentals..sort((a, b) => (a.rentalDate).compareTo(b.rentalDate));
  }

  @override
  Future<void> insert(Rental rental) async {
    if (_rentals.contains(rental)) {
      update(rental);
    } else {
      _rentals.add(rental);
    }
  }

  @override
  Future<void> update(Rental rental) async {
    _rentals = _rentals.map((e) {
      if (e.book.id == rental.book.id) {
        return rental;
      }
      return e;
    }).toList();
  }

  @override
  Future<void> delete(Rental rental) async {
    _rentals.remove(rental);
  }
}
