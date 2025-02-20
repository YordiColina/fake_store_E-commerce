import 'package:fake_store_package/models/user/get_user.dart';
import 'package:fake_store_package/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_usecases/add_user_usecase.dart';



class CreateUserNotifier extends StateNotifier<bool> {
  final AddUserUseCase addUserUseCase;

  CreateUserNotifier({
    required this.addUserUseCase,
  }) : super(false); // Estado inicial: usuario vacío (null)


  // Agregar un usuario
  Future<Map<String,dynamic>> addUser(User user) async {
  final userResult = await addUserUseCase.execute(user);
  state = userResult.isNotEmpty; // Actualiza el estado con el resultado de la operación
  return userResult;
  }
}

// Provider para el UserNotifier
