import 'package:flutter/material.dart';

import 'shipping_models.dart';

class ShippingTile extends StatelessWidget {
  const ShippingTile({super.key, required this.item, this.onTap});

  final ShippingItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class ShippingListView extends StatelessWidget {
  const ShippingListView({super.key, required this.state});

  final ShippingState state;

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
            itemBuilder: (_, i) => ShippingTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
