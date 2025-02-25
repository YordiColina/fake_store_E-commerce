import 'package:fake_store_e_commerce/domain/models/fake_auth/repository/auth_repository.dart';

class GetLocalUserUseCase {
  final AuthRepository _authRepository;

  GetLocalUserUseCase(this._authRepository);

  Future<Map<String, String>?> execute() {
    return _authRepository.getUser();
  }
}
