import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/features/orders/domain/item.dart';
import 'package:test_flutter/src/features/orders/domain/order.dart';

class FakeOrdersRepository {
  final _orders = <Order>[
    Order(
      id: 1,
      table: '1',
      guests: 2,
      date: null,
      items: [
        Item(
          id: 1,
          name: 'one',
          price: 1,
          currency: '€',
          color: Colors.red,
        ),
        Item(
          id: 2,
          name: 'one',
          price: 12.20,
          currency: '€',
          color: Colors.red,
        ),
      ],
    ),
    Order(
      id: 2,
      table: '2',
      guests: 3,
      date: null,
      items: [
        Item(
          id: 1,
          name: 'one',
          price: 1,
          currency: '€',
          color: Colors.red,
        ),
        Item(
          id: 2,
          name: 'one',
          price: 6.55,
          currency: '€',
          color: Colors.red,
        ),
      ],
    ),
  ];

  Future<List<Order>> _fetchOrders() async {
    // emulate network request
    await Future.delayed(const Duration(seconds: 2));

    return _orders;
  }
}

final fakeOrdersRepositoryProvider = Provider<FakeOrdersRepository>((ref) {
  return FakeOrdersRepository();
});

final fakeOrdersFutureProvider = FutureProvider<List<Order>>((ref) async {
  final fakeOrdersRepository = ref.watch(fakeOrdersRepositoryProvider);
  return fakeOrdersRepository._fetchOrders();
});
