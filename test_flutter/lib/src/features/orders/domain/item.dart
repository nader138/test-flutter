import 'package:flutter/material.dart';

typedef ItemID = int;

class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.color,
  });

  final ItemID id;
  final String name;
  final int price;
  final String currency;
  final Color color;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price, currency: $currency, color: $color)';
  }
}
