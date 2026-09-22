import 'package:flutter/material.dart';

import 'calendar_models.dart';

class CalendarTile extends StatelessWidget {
  const CalendarTile({super.key, required this.item, this.onTap});

  final CalendarItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class CalendarListView extends StatelessWidget {
  const CalendarListView({super.key, required this.state});

  final CalendarState state;

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
            itemBuilder: (_, i) => CalendarTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
