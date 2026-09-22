import 'package:flutter/material.dart';

import 'billing_models.dart';

class BillingTile extends StatelessWidget {
  const BillingTile({super.key, required this.item, this.onTap});

  final BillingItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class BillingListView extends StatelessWidget {
  const BillingListView({super.key, required this.state});

  final BillingState state;

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
            itemBuilder: (_, i) => BillingTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
