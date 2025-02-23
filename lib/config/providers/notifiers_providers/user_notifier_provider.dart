import 'package:fake_store_package/models/user/get_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/user_notifier.dart';
import '../usecases_provider/user_usecases_provider.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, GetUser?>((ref) {

  return UserNotifier(
    getUserUseCase: ref.watch(getUserUseCaseProvider),
  );
});