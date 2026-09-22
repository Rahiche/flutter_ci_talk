import 'package:flutter/material.dart';

import 'stories_models.dart';

class StoriesTile extends StatelessWidget {
  const StoriesTile({super.key, required this.item, this.onTap});

  final StoriesItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class StoriesListView extends StatelessWidget {
  const StoriesListView({super.key, required this.state});

  final StoriesState state;

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
            itemBuilder: (_, i) => StoriesTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
