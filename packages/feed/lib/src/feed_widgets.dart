import 'package:flutter/material.dart';

import 'feed_models.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({super.key, required this.item, this.onTap});

  final FeedItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class FeedListView extends StatelessWidget {
  const FeedListView({super.key, required this.state});

  final FeedState state;

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
            itemBuilder: (_, i) => FeedTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
