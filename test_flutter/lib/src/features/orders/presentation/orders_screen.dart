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
      body: ordersValue.when(
        data: (orders) {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      color: Colors.red,
                      child: Text(
                        orders[index].table,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        error: (e, st) => Center(child: Text(e.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
