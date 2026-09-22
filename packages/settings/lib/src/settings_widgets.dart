import 'package:flutter/material.dart';

import 'settings_models.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.item, this.onTap});

  final SettingsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key, required this.state});

  final SettingsState state;

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
            itemBuilder: (_, i) => SettingsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
