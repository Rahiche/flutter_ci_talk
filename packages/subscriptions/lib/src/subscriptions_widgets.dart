import 'package:flutter/material.dart';

import 'subscriptions_models.dart';

class SubscriptionsTile extends StatelessWidget {
  const SubscriptionsTile({super.key, required this.item, this.onTap});

  final SubscriptionsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class SubscriptionsListView extends StatelessWidget {
  const SubscriptionsListView({super.key, required this.state});

  final SubscriptionsState state;

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
            itemBuilder: (_, i) => SubscriptionsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
