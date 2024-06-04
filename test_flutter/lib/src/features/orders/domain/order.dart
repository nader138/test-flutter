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
  final List<Map<String, dynamic>> items;

  @override
  String toString() {
    return 'Order(id: $id, table: $table, guests: $guests, date: $date, items: $items)';
  }
}
