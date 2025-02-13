import 'package:fake_store_e_commerce/domain/models/fake_auth/repository/auth_repository.dart';
import 'package:fake_store_package/models/auth/login_request.dart';


class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<void> execute(LoginRequest loginRequest) async {
    return _authRepository.login(loginRequest);
  }
}