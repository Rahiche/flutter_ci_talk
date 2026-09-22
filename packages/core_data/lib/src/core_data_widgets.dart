import 'package:flutter/material.dart';

import 'core_data_models.dart';

class CoreDataTile extends StatelessWidget {
  const CoreDataTile({super.key, required this.item, this.onTap});

  final CoreDataItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CoreDataListView extends StatelessWidget {
  const CoreDataListView({super.key, required this.state});

  final CoreDataState state;

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
            itemBuilder: (_, i) => CoreDataTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
