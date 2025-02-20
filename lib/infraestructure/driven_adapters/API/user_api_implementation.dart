import 'package:fake_store_e_commerce/domain/models/fake_user/repository/user_repository.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/user/get_user.dart';
import 'package:fake_store_package/models/user/user.dart';

class UserApiImplementation implements UserRepository {
  final fakeStore = FakeStorePackage();
  @override
  Future<Map<String,dynamic>> createUser(User user) async {
    // Enviar el usuario convertido a FakeStore
    final result = await fakeStore.createUser(user);
    return result.fold(
      (error) => throw Exception('Error al crear el usuario: $error'),
      (user) {
        print('Usuario creado con éxito: $user');
        return user;
    },
    );
  }

  @override
  Future<GetUser> getUser(int id) async {
  final result = await fakeStore.getUser(id);
  return result.fold<GetUser>(
    (error) => throw Exception('Error al obtener el usuario: $error'),
    (user) =>  user,
  );
  }

}