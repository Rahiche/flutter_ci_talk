import 'package:flutter/material.dart';

import 'checkout_models.dart';

class CheckoutTile extends StatelessWidget {
  const CheckoutTile({super.key, required this.item, this.onTap});

  final CheckoutItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CheckoutListView extends StatelessWidget {
  const CheckoutListView({super.key, required this.state});

  final CheckoutState state;

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
            itemBuilder: (_, i) => CheckoutTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
