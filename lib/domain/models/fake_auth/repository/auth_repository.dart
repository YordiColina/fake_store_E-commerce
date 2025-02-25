import 'package:fake_store_package/models/auth/login_request.dart';

abstract class AuthRepository {
  Future<void> login(LoginRequest loginRequest);
  Future<bool> saveUser(String username, String password);
  Future<Map<String, String>?> getUser();
}