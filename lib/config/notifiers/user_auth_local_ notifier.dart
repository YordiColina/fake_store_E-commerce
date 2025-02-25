import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/auth_usecases/get_local_user_usecase.dart';
import '../../domain/usecases/auth_usecases/save_Local_User_Usecase.dart';

class UserAuthLocalNotifier extends StateNotifier<bool> {
  final SaveLocalUserUseCase saveUserUseCase;
  final GetLocalUserUseCase getUserUseCase;

  UserAuthLocalNotifier({
    required this.saveUserUseCase,
    required this.getUserUseCase,
  }) : super(false);

  Future<bool> saveUser(String username, String password) async {
    final result = await saveUserUseCase.execute(username, password);
    state = result; // Si el guardado fue exitoso, actualiza el estado a true
    return result;
  }

  Future<Map<String, String>?> getUser() async {
    return await getUserUseCase.execute();
  }
}
