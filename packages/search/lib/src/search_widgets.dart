import 'package:flutter/material.dart';

import 'search_models.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key, required this.item, this.onTap});

  final SearchItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.state});

  final SearchState state;

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
            itemBuilder: (_, i) => SearchTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
