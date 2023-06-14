import '../../model/user.dart';
import 'user_repository.dart';

class UserMemoryRepositoryImpl implements UserRepository {
  List<User> _users = [];

  @override
  Future<List<User>> findAll() async {
    return _users;
  }

  @override
  Future<User?> findById(int id) async {
    if (_users.any((e) => e.id == id) == false) return null;
    return _users.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> insert(User user) async {
    if (_users.contains(user)) {
      update(user);
    } else {
      _users.add(user);
    }
  }

  @override
  Future<void> update(User user) async {
    _users = _users.map((e) {
      if (e.id == user.id) {
        return user;
      }
      return e;
    }).toList();
  }

  @override
  Future<void> delete(User user) async {
    _users.remove(user);
  }
}
