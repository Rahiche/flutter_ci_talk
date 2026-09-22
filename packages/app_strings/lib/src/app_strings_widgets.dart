import 'package:flutter/material.dart';

import 'app_strings_models.dart';

class AppStringsTile extends StatelessWidget {
  const AppStringsTile({super.key, required this.item, this.onTap});

  final AppStringsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class AppStringsListView extends StatelessWidget {
  const AppStringsListView({super.key, required this.state});

  final AppStringsState state;

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
            itemBuilder: (_, i) => AppStringsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
