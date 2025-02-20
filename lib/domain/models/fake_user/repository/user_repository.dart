import 'package:dartz/dartz.dart';
import 'package:fake_store_package/models/user/get_user.dart';
import 'package:fake_store_package/models/user/user.dart';



abstract class UserRepository {
  Future<GetUser> getUser(int id);
  Future<Map<String,dynamic>> createUser(User user);
}