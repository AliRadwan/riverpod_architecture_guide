import 'package:flutter/material.dart';

typedef ProductId = String;

class Product {
  const Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  /// Unique product id
  final ProductId id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;
}

class Item {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final int quantity;

  const Item({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}
