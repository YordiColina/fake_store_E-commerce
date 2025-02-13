import 'package:fake_store_package/models/auth/login_request.dart';

abstract class AuthRepository {
  Future<void> login(LoginRequest loginRequest);
}