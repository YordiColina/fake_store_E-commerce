import 'package:fake_store_e_commerce/domain/models/fake_auth/repository/auth_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/auth/login_request.dart';

class AuthApiImplementation implements AuthRepository {
  final fakeStore = FakeStorePackage();
  
  @override
  Future<void> login(LoginRequest loginRequest) async {
   final result = await fakeStore.login(loginRequest);
    return result.fold(
      (error) => throw Exception('Error al iniciar sesión: $error'),
      (loginSuccess) => loginSuccess,
    );
  }
}