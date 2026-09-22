import 'package:flutter/material.dart';

import 'analytics_events_models.dart';

class AnalyticsEventsTile extends StatelessWidget {
  const AnalyticsEventsTile({super.key, required this.item, this.onTap});

  final AnalyticsEventsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class AnalyticsEventsListView extends StatelessWidget {
  const AnalyticsEventsListView({super.key, required this.state});

  final AnalyticsEventsState state;

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
            itemBuilder: (_, i) => AnalyticsEventsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
