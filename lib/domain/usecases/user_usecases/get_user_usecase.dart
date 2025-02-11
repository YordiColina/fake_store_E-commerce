import '../../models/fake_user/repository/user_repository.dart';
import '../../models/fake_user/user.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<User> execute(int id) {
    return _userRepository.getUser(id);
  }
}