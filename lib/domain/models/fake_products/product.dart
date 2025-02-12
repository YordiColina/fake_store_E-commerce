import 'package:fake_store_package/models/products/product.dart' as FakeStoreProduct;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
@immutable
class Product {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "price")
  final double price;

  @JsonKey(name: "category")
  final String category;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "image")
  final String image;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  /// Método de conversión desde el modelo del paquete
  factory Product.fromFakeStoreProduct(FakeStoreProduct.Product p) {
    return Product(
      id: p.id,
      title: p.title,
      price: p.price,
      category: p.category,
      description: p.description,
      image: p.image,
    );
  }
}
