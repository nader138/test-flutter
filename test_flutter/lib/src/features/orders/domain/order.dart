import 'package:flutter/material.dart';
import 'package:test_flutter/src/features/orders/domain/item.dart';

typedef OrderID = int;

class Order {
  Order({
    required this.id,
    required this.table,
    required this.guests,
    required this.date,
    required this.items,
  });

  final OrderID id;
  final String table;
  final int guests;
  final DateTime? date;
  final List<Item> items;

  factory Order.fromJson(Map<String, dynamic> data) {
    return Order(
      id: data['id'],
      table: data['table'],
      guests: data['guests'],
      date: null,
      items: data['items'] is Iterable
          ? List<Map<String, dynamic>>.from(data['items']).map((item) {
              final parsedColor = int.parse(
                  (item['color'] as String).replaceFirst(RegExp(r'#'), '0x'));

              final priceString = (item['price'] as int).toString();
              final lastTwoDigits = priceString.length - 2;
              final price = double.parse(
                  priceString.replaceRange(lastTwoDigits, lastTwoDigits, '.'));

              return Item(
                id: item['id'],
                name: item['name'],
                price: price,
                currency: item['currency'],
                color: Color(parsedColor),
              );
            }).toList()
          : [],
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, table: $table, guests: $guests, date: $date, items: $items)';
  }
}
