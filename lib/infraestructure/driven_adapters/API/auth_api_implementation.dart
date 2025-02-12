import 'package:fake_store_e_commerce/domain/models/fake_auth/login_request.dart';
import 'package:fake_store_e_commerce/domain/models/fake_auth/repository/auth_repository.dart';

class AuthApiImplementation implements AuthRepository {

  @override
  Future<void> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }

}