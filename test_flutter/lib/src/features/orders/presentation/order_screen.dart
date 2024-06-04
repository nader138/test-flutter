import 'package:flutter/material.dart';
import 'package:test_flutter/src/features/orders/domain/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
