import 'package:fake_store_e_commerce/domain/models/fake_auth/repository/auth_repository.dart';

import '../../models/fake_auth/login_request.dart';
import '../../models/fake_products/product.dart';
import '../../models/fake_products/repository/product_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<void> execute(LoginRequest loginRequest) async {
    return _authRepository.login(loginRequest);
  }
}