import '../../models/fake_user/repository/user_repository.dart';
import '../../models/fake_user/user.dart';

class AddUserUseCase {
  final UserRepository _userRepository;

  AddUserUseCase(this._userRepository);

  Future<void> execute(User user) async {
    return _userRepository.createUser(user);
  }
}