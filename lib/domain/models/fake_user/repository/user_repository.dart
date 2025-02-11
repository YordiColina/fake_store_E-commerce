import '../user.dart';

abstract class UserRepository {
  Future<User> getUser(int id);
  Future<void> createUser(User user);
}