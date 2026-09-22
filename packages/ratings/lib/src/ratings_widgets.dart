import 'package:flutter/material.dart';

import 'ratings_models.dart';

class RatingsTile extends StatelessWidget {
  const RatingsTile({super.key, required this.item, this.onTap});

  final RatingsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class RatingsListView extends StatelessWidget {
  const RatingsListView({super.key, required this.state});

  final RatingsState state;

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
            itemBuilder: (_, i) => RatingsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
