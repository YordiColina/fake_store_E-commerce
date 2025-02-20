import 'package:fake_store_package/models/user/get_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_usecases/add_user_usecase.dart';
import '../../../domain/usecases/user_usecases/get_user_usecase.dart';
import '../../notifiers/create_user_notifier.dart';
import '../../notifiers/user_notifier.dart';
import '../repository_providers/user_repository_provider.dart';

final createUserNotifierProvider = StateNotifierProvider<CreateUserNotifier, bool>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return CreateUserNotifier(
    addUserUseCase: AddUserUseCase(userRepository),
  );
});