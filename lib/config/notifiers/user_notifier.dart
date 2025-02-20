import 'package:fake_store_package/models/user/get_user.dart';
import 'package:fake_store_package/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_usecases/add_user_usecase.dart';
import '../../../domain/usecases/user_usecases/get_user_usecase.dart';


class UserNotifier extends StateNotifier<GetUser?> {
  final GetUserUseCase getUserUseCase;

  UserNotifier({
    required this.getUserUseCase,
  }) : super(null); // Estado inicial: usuario vacío (null)

  // Obtener un usuario por ID
  Future<GetUser> getUser(int id) async {
    final user = await getUserUseCase.execute(id);
    state = user; // Actualiza el estado con el usuario obtenido
    return user;
  }
}

// Provider para el UserNotifier
