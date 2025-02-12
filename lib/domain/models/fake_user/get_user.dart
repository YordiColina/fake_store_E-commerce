import 'package:fake_store_e_commerce/domain/models/fake_user/user.dart';
import 'package:fake_store_e_commerce/domain/models/fake_user/user.dart' as FakeStoreUser;
import 'package:json_annotation/json_annotation.dart';


part 'get_user.g.dart';

@JsonSerializable()
class GetUser {
  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "username")
  final String username;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "name")
  final Name name;

  @JsonKey(name: "address")
  final Address address;

  @JsonKey(name: "phone")
  final String phone;

  GetUser({
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory GetUser.fromJson(Map<String, dynamic> json) =>
      _$GetUserFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserToJson(this);

  factory GetUser.fromFakeStoreUser(FakeStoreUser.User user) {
    return GetUser(
      email: user.email,
      username: user.username,
      password: user.password,
      name: Name.fromFakeStoreName(user.name),  // 🔥 Conversión explícita
      address: Address.fromFakeStoreAddress(user.address),  // 🔥 Conversión explícita
      phone: user.phone,
    );
  }

}
