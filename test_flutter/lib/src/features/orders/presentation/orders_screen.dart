import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/features/orders/data/fake_orders_repository.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersValue = ref.watch(fakeOrdersFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: ordersValue.when(
          data: (orders) => Text('${orders.length} commandes'),
          error: (e, st) => Center(child: Text(e.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      body: const Placeholder(),
    );
  }
}
