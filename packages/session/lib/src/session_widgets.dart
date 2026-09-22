import 'package:flutter/material.dart';

import 'session_models.dart';

class SessionTile extends StatelessWidget {
  const SessionTile({super.key, required this.item, this.onTap});

  final SessionItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class SessionListView extends StatelessWidget {
  const SessionListView({super.key, required this.state});

  final SessionState state;

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
            itemBuilder: (_, i) => SessionTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
