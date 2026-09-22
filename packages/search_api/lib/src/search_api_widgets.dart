import 'package:flutter/material.dart';

import 'search_api_models.dart';

class SearchApiTile extends StatelessWidget {
  const SearchApiTile({super.key, required this.item, this.onTap});

  final SearchApiItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class SearchApiListView extends StatelessWidget {
  const SearchApiListView({super.key, required this.state});

  final SearchApiState state;

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
            itemBuilder: (_, i) => SearchApiTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
