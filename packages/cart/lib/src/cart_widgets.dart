import 'package:flutter/material.dart';

import 'cart_models.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.item, this.onTap});

  final CartItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.state});

  final CartState state;

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
            itemBuilder: (_, i) => CartTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
