import 'package:flutter/material.dart';

import 'core_utils_models.dart';

class CoreUtilsTile extends StatelessWidget {
  const CoreUtilsTile({super.key, required this.item, this.onTap});

  final CoreUtilsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CoreUtilsListView extends StatelessWidget {
  const CoreUtilsListView({super.key, required this.state});

  final CoreUtilsState state;

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
            itemBuilder: (_, i) => CoreUtilsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
