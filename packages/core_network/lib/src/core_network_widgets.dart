import 'package:flutter/material.dart';

import 'core_network_models.dart';

class CoreNetworkTile extends StatelessWidget {
  const CoreNetworkTile({super.key, required this.item, this.onTap});

  final CoreNetworkItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CoreNetworkListView extends StatelessWidget {
  const CoreNetworkListView({super.key, required this.state});

  final CoreNetworkState state;

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
            itemBuilder: (_, i) => CoreNetworkTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
