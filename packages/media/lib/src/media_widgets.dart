import 'package:flutter/material.dart';

import 'media_models.dart';

class MediaTile extends StatelessWidget {
  const MediaTile({super.key, required this.item, this.onTap});

  final MediaItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class MediaListView extends StatelessWidget {
  const MediaListView({super.key, required this.state});

  final MediaState state;

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
            itemBuilder: (_, i) => MediaTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
