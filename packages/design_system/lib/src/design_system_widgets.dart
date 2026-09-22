import 'package:flutter/material.dart';

import 'design_system_models.dart';

class DesignSystemTile extends StatelessWidget {
  const DesignSystemTile({super.key, required this.item, this.onTap});

  final DesignSystemItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class DesignSystemListView extends StatelessWidget {
  const DesignSystemListView({super.key, required this.state});

  final DesignSystemState state;

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
            itemBuilder: (_, i) => DesignSystemTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
