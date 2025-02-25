import '../../models/fake_auth/repository/auth_repository.dart';

class SaveLocalUserUseCase {
  final AuthRepository _authRepository;

  SaveLocalUserUseCase(this._authRepository);

  Future<bool> execute(String username, String password) {
    return _authRepository.saveUser(username, password);
  }
}
