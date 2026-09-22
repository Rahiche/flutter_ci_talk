import 'package:flutter/material.dart';

import 'l10n_models.dart';

class L10nTile extends StatelessWidget {
  const L10nTile({super.key, required this.item, this.onTap});

  final L10nItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class L10nListView extends StatelessWidget {
  const L10nListView({super.key, required this.state});

  final L10nState state;

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
            itemBuilder: (_, i) => L10nTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
