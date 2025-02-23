import 'package:fake_store_e_commerce/config/providers/usecases_provider/user_usecases_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/create_user_notifier.dart';


final createUserNotifierProvider = StateNotifierProvider<CreateUserNotifier, bool>((ref) {

  return CreateUserNotifier(
    addUserUseCase: ref.watch(addUserUseCaseProvider)
  );
});