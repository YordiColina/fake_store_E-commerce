import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_usecases/add_user_usecase.dart';
import '../../../domain/usecases/user_usecases/get_user_usecase.dart';
import '../repository_providers/user_repository_provider.dart';

final addUserUseCaseProvider = Provider((ref) {
  final repository = ref.read(userRepositoryProvider);
  return AddUserUseCase(repository);
});

final getUserUseCaseProvider = Provider((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetUserUseCase(repository);
});
