import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/auth_usecases/get_local_user_usecase.dart';
import '../../../domain/usecases/auth_usecases/login_usecase.dart';
import '../../../domain/usecases/auth_usecases/save_Local_User_Usecase.dart';
import '../repository_providers/auth_repository_provider.dart';

final loginUseCaseProvider = Provider((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginUseCase(repository);
});

final saveLocalUserUseCaseProvider = Provider((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SaveLocalUserUseCase(repository);
});

final getLocalUserUseCaseProvider = Provider((ref) {
  final repository = ref.read(authRepositoryProvider);
  return GetLocalUserUseCase(repository);
});
