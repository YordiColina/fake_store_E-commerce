import 'package:fake_store_e_commerce/domain/models/fake_auth/login_request.dart';

abstract class AuthRepository {
  Future<void> login(LoginRequest loginRequest);
}