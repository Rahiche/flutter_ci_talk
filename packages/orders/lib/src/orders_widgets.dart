import 'package:flutter/material.dart';

import 'orders_models.dart';

class OrdersTile extends StatelessWidget {
  const OrdersTile({super.key, required this.item, this.onTap});

  final OrdersItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.state});

  final OrdersState state;

  @override
  Widget build(BuildContext context) {
    if (state.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        Text('total ${state.total}', key: const Key('total')),
        Expanded(
          child: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (_, i) => OrdersTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
