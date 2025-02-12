import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/auth_usecases/login_usecase.dart';
import '../../notifiers/auth_notifier.dart';
import '../repository_providers/auth_repository_provider.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(
    loginUseCase: LoginUseCase(authRepository),
  );
});