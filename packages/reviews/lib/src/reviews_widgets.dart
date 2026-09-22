import 'package:flutter/material.dart';

import 'reviews_models.dart';

class ReviewsTile extends StatelessWidget {
  const ReviewsTile({super.key, required this.item, this.onTap});

  final ReviewsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.state});

  final ReviewsState state;

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
            itemBuilder: (_, i) => ReviewsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
