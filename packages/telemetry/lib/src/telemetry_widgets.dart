import 'package:flutter/material.dart';

import 'telemetry_models.dart';

class TelemetryTile extends StatelessWidget {
  const TelemetryTile({super.key, required this.item, this.onTap});

  final TelemetryItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class TelemetryListView extends StatelessWidget {
  const TelemetryListView({super.key, required this.state});

  final TelemetryState state;

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
            itemBuilder: (_, i) => TelemetryTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
