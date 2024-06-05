import 'package:flutter/material.dart';
import 'package:test_flutter/src/features/orders/domain/item.dart';
import 'package:test_flutter/src/features/orders/domain/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final total = order.items.fold<double>(
      0,
      (previousValue, element) => previousValue + element.price,
    );

    // TODO: try refactoring with .reduce()
    // count unique items
    final itemsCountMap = <OrderID, ({Item item, int count})>{};
    for (var item in order.items) {
      itemsCountMap.update(
        item.id,
        (value) => (item: value.item, count: value.count + 1),
        ifAbsent: () => (item: item, count: 1),
      );
    }

    final itemsCountList = itemsCountMap.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('table ${order.table}'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('${order.items.length} produits'),
              const SizedBox(width: 8),
              Text('$total €')
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: itemsCountList.length,
            itemBuilder: (context, index) {
              final count = itemsCountList[index].count;
              final itemName = itemsCountList[index].item.name;
              final sum = itemsCountList[index].item.price * count;

              return Row(
                children: [
                  Text(
                    '$count $itemName $sum€',
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
