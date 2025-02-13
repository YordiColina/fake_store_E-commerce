import 'package:fake_store_package/models/user/get_user.dart';
import '../../models/fake_user/repository/user_repository.dart';


class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<GetUser> execute(int id) {
    return _userRepository.getUser(id);
  }
}