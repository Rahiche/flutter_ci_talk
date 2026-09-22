import 'package:flutter/material.dart';

import 'maps_models.dart';

class MapsTile extends StatelessWidget {
  const MapsTile({super.key, required this.item, this.onTap});

  final MapsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class MapsListView extends StatelessWidget {
  const MapsListView({super.key, required this.state});

  final MapsState state;

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
            itemBuilder: (_, i) => MapsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
