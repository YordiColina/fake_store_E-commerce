import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/auth_usecases/login_usecase.dart';
import '../repository_providers/auth_repository_provider.dart';

final loginUseCaseProvider = Provider((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginUseCase(repository);
});
