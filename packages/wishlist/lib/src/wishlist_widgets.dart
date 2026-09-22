import 'package:flutter/material.dart';

import 'wishlist_models.dart';

class WishlistTile extends StatelessWidget {
  const WishlistTile({super.key, required this.item, this.onTap});

  final WishlistItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class WishlistListView extends StatelessWidget {
  const WishlistListView({super.key, required this.state});

  final WishlistState state;

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
            itemBuilder: (_, i) => WishlistTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
