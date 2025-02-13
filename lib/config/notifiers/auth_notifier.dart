import 'package:fake_store_package/models/auth/login_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/auth_usecases/login_usecase.dart';

class AuthNotifier extends StateNotifier<bool> {
  final LoginUseCase loginUseCase;

  AuthNotifier({
    required this.loginUseCase,
  }) : super(false); // Estado inicial: no autenticado (false)

  // Realizar el proceso de inicio de sesión
  Future<void> login(LoginRequest loginRequest) async {
    try {
      await loginUseCase.execute(loginRequest);
      state = true; // Actualiza el estado a autenticado (true)
    } catch (e) {
      state = false; // Si hay un error, el estado sigue siendo no autenticado (false)
      rethrow; // Relanza la excepción para manejarla en la UI
    }
  }

  // Cerrar sesión
  void logout() {
    state = false; // Actualiza el estado a no autenticado (false)
  }
}

