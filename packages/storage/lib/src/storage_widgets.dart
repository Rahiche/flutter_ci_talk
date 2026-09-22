import 'package:flutter/material.dart';

import 'storage_models.dart';

class StorageTile extends StatelessWidget {
  const StorageTile({super.key, required this.item, this.onTap});

  final StorageItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class StorageListView extends StatelessWidget {
  const StorageListView({super.key, required this.state});

  final StorageState state;

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
            itemBuilder: (_, i) => StorageTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
