import 'package:flutter/material.dart';

import 'catalog_models.dart';

class CatalogTile extends StatelessWidget {
  const CatalogTile({super.key, required this.item, this.onTap});

  final CatalogItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CatalogListView extends StatelessWidget {
  const CatalogListView({super.key, required this.state});

  final CatalogState state;

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
            itemBuilder: (_, i) => CatalogTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
