import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fake_store_package/models/categories/categories.dart' as FakeStoreCategories;

part 'categories.g.dart';

@JsonSerializable()
@immutable
class Categories {
  final List<String> categories;

  const Categories({required this.categories});

  factory Categories.fromJson(List<dynamic> json) =>
      Categories(categories: json.cast<String>());

  Map<String, dynamic> toJson() => {'categories': categories};

  /// Método de conversión desde el modelo del paquete
  factory Categories.fromFakeStoreCategories(FakeStoreCategories.Categories c) {
    return Categories(categories: c.categories);
  }
}
