import 'package:fake_store_e_commerce/domain/models/fake_user/user.dart' as FakeStoreUser;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
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

  User({
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromFakeStoreUser(FakeStoreUser.User user) {
    return User(
      email: user.email,
      username: user.username,
      password: user.password,
      name: Name.fromFakeStoreName(user.name),
      address: Address.fromFakeStoreAddress(user.address),
      phone: user.phone,
    );
  }
}

@JsonSerializable()
class Name {
  @JsonKey(name: "firstname")
  final String firstname;

  @JsonKey(name: "lastname")
  final String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);

  factory Name.fromFakeStoreName(FakeStoreUser.Name name) {
    return Name(
      firstname: name.firstname,
      lastname: name.lastname,
    );
  }
}

@JsonSerializable()
class Address {
  @JsonKey(name: "city")
  final String city;

  @JsonKey(name: "street")
  final String street;

  @JsonKey(name: "number")
  final int number;

  @JsonKey(name: "zipcode")
  final String zipcode;

  @JsonKey(name: "geolocation")
  final Geolocation geolocation;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  factory Address.fromFakeStoreAddress(FakeStoreUser.Address address) {
    return Address(
      city: address.city,
      street: address.street,
      number: address.number,
      zipcode: address.zipcode,
      geolocation: Geolocation.fromFakeStoreGeolocation(address.geolocation),
    );
  }
}

@JsonSerializable()
class Geolocation {
  @JsonKey(name: "lat")
  final String lat;

  @JsonKey(name: "long")
  final String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);

  Map<String, dynamic> toJson() => _$GeolocationToJson(this);

  factory Geolocation.fromFakeStoreGeolocation(FakeStoreUser.Geolocation geo) {
    return Geolocation(
      lat: geo.lat,
      long: geo.long,
    );
  }
}
