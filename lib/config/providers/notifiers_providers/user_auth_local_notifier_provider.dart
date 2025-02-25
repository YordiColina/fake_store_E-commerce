import 'package:fake_store_e_commerce/config/notifiers/user_auth_local_%20notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases_provider/auth_usecases_provider.dart';

final userAuthLocalNotifierProvider = StateNotifierProvider<UserAuthLocalNotifier, bool>((ref) {
  return UserAuthLocalNotifier(
      saveUserUseCase: ref.watch(saveLocalUserUseCaseProvider),
      getUserUseCase:  ref.watch(getLocalUserUseCaseProvider),
  );
});