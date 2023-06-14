import '../../model/user.dart';

abstract interface class UserRepository {
  Future<void> insert(User user);
  Future<void> update(User user);
  Future<void> delete(User user);
  Future<List<User>> findAll();
  Future<User?> findById(int id);
}
