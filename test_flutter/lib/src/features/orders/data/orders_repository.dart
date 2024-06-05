import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/features/orders/domain/order.dart';

class OrdersRepository {
  Future<List<Order>> _fetchOrders() async {
    Response response = await Dio().get(
        "https://raw.githubusercontent.com/popina/test-flutter/main/data.json");

    final dataMap = jsonDecode(response.data) as Map<String, dynamic>;
    final ordersMap = List<Map<String, dynamic>>.from(dataMap['orders']);

    return ordersMap.map(Order.fromJson).toList();
  }
}

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  return OrdersRepository();
});

final ordersFutureProvider =
    FutureProvider.autoDispose<List<Order>>((ref) async {
  final ordersRepository = ref.watch(ordersRepositoryProvider);
  return ordersRepository._fetchOrders();
});
