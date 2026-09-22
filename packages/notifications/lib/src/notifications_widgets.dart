import 'package:flutter/material.dart';

import 'notifications_models.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({super.key, required this.item, this.onTap});

  final NotificationsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.state});

  final NotificationsState state;

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
            itemBuilder: (_, i) => NotificationsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
