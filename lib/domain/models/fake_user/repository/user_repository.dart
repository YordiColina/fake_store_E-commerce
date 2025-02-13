import 'package:fake_store_package/models/user/get_user.dart';
import 'package:fake_store_package/models/user/user.dart';



abstract class UserRepository {
  Future<GetUser> getUser(int id);
  Future<void> createUser(User user);
}