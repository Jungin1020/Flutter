import '../../model/rental.dart';

abstract interface class RentalRepository {
  Future<void> insert(Rental rental);
  Future<void> update(Rental rental);
  Future<void> delete(Rental rental);
  Future<List<Rental>> findAll();
}
