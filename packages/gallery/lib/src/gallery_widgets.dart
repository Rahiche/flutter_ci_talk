import 'package:flutter/material.dart';

import 'gallery_models.dart';

class GalleryTile extends StatelessWidget {
  const GalleryTile({super.key, required this.item, this.onTap});

  final GalleryItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class GalleryListView extends StatelessWidget {
  const GalleryListView({super.key, required this.state});

  final GalleryState state;

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
            itemBuilder: (_, i) => GalleryTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
