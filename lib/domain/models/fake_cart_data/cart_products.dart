import 'package:fake_store_e_commerce/domain/models/fake_cart_data/cart_products.dart';
import 'package:fake_store_package/models/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fake_store_package/models/cart/cart.dart' as FakeStoreCart;
import 'package:fake_store_package/models/cart/cart_request.dart' as FakeStoreCartRequest;

import 'cart_products.dart';

part 'cart_products.g.dart';

@JsonSerializable()
@immutable
class CartProducts {
  @JsonKey(name: "productId")
  final int productId;

  @JsonKey(name: "quantity")
  final int quantity;

  const CartProducts({
    required this.productId,
    required this.quantity,
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) => _$CartProductsFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductsToJson(this);

  /// Conversión desde el modelo `FakeStoreCart`
  factory CartProducts.fromFakeStoreCartProduct(FakeStoreCart.CartProducts p) {
    return CartProducts(
      productId: p.productId,
      quantity: p.quantity,
    );
  }

  /// Conversión a `FakeStoreCartRequest.CartProducts`
  FakeStoreCart.FakeStoreCartRequest.CartProducts toFakeStoreCartProduct() {
    return FakeStoreCartRequest.CartProducts(
      productId: productId,
      quantity: quantity,
    );
  }
}
