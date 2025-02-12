import 'package:fake_store_e_commerce/domain/models/fake_user/repository/user_repository.dart';
import 'package:fake_store_e_commerce/domain/models/fake_user/user.dart';

class UserApiImplementation implements UserRepository {
  @override
  Future<void> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}