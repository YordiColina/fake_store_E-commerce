import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fake_store_package/models/cart/cart.dart' as FakeStoreCart;
import 'cart_products.dart'; // ✅ Importamos el modelo separado

part 'cart.g.dart';

@JsonSerializable()
@immutable
class Cart {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "userId")
  final int userId;

  @JsonKey(name: "date", fromJson: _fromJsonDate, toJson: _toJsonDate)
  final DateTime date;

  @JsonKey(name: "products")
  final List<CartProducts> products; // ✅ Ahora sí está definido antes de usarse

  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);

  // Métodos para convertir la fecha
  static DateTime _fromJsonDate(dynamic date) => DateTime.parse(date as String);
  static String _toJsonDate(DateTime date) => date.toIso8601String();

  /// Conversión desde `FakeStoreCart`
  factory Cart.fromFakeStoreCart(FakeStoreCart.Cart c) {
    return Cart(
      id: c.id,
      userId: c.userId,
      date: c.date,
      products: c.products.map((p) => CartProducts.fromFakeStoreCartProduct(p)).toList(),
    );
  }
}
