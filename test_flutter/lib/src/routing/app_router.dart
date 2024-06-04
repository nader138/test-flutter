import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/src/features/orders/presentation/order_screen.dart';
import 'package:test_flutter/src/features/orders/presentation/orders_screen.dart';

enum AppRoute {
  orders,
  order,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/orders',
    routes: [
      GoRoute(
        path: '/orders',
        name: AppRoute.orders.name,
        builder: (context, state) => const OrdersScreen(),
        routes: [
          GoRoute(
            path: 'order',
            name: AppRoute.order.name,
            builder: (context, state) => const OrderScreen(),
          ),
        ],
      ),
    ],
  );
});
