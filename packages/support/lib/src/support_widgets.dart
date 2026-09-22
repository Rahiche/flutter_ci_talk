import 'package:flutter/material.dart';

import 'support_models.dart';

class SupportTile extends StatelessWidget {
  const SupportTile({super.key, required this.item, this.onTap});

  final SupportItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class SupportListView extends StatelessWidget {
  const SupportListView({super.key, required this.state});

  final SupportState state;

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
            itemBuilder: (_, i) => SupportTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
