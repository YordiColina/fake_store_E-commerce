import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/auth_notifier.dart';
import '../usecases_provider/auth_usecases_provider.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(
    loginUseCase: ref.watch(loginUseCaseProvider),
  );
});