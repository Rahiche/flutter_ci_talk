import 'package:flutter/material.dart';

import 'core_ui_models.dart';

class CoreUiTile extends StatelessWidget {
  const CoreUiTile({super.key, required this.item, this.onTap});

  final CoreUiItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CoreUiListView extends StatelessWidget {
  const CoreUiListView({super.key, required this.state});

  final CoreUiState state;

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
            itemBuilder: (_, i) => CoreUiTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
