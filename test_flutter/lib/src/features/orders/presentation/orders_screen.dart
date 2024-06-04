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
              final total = orders[index].items.fold<double>(
                    0,
                    (previousValue, element) => previousValue + element.price,
                  );

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
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.face),
                            Text('${orders[index].guests}'),
                          ],
                        ),
                        if (orders[index].date != null)
                          Text(orders[index].date.toString()),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Text('$total')
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
