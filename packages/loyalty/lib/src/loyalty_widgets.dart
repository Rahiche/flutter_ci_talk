import 'package:flutter/material.dart';

import 'loyalty_models.dart';

class LoyaltyTile extends StatelessWidget {
  const LoyaltyTile({super.key, required this.item, this.onTap});

  final LoyaltyItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class LoyaltyListView extends StatelessWidget {
  const LoyaltyListView({super.key, required this.state});

  final LoyaltyState state;

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
            itemBuilder: (_, i) => LoyaltyTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
