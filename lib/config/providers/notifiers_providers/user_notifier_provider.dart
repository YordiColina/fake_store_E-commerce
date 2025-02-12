import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_user/user.dart';
import '../../../domain/usecases/user_usecases/add_user_usecase.dart';
import '../../../domain/usecases/user_usecases/get_user_usecase.dart';
import '../../notifiers/user_notifier.dart';
import '../repository_providers/user_repository_provider.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserNotifier(
    addUserUseCase: AddUserUseCase(userRepository),
    getUserUseCase: GetUserUseCase(userRepository),
  );
});