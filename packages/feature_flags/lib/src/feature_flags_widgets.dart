import 'package:flutter/material.dart';

import 'feature_flags_models.dart';

class FeatureFlagsTile extends StatelessWidget {
  const FeatureFlagsTile({super.key, required this.item, this.onTap});

  final FeatureFlagsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class FeatureFlagsListView extends StatelessWidget {
  const FeatureFlagsListView({super.key, required this.state});

  final FeatureFlagsState state;

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
            itemBuilder: (_, i) => FeatureFlagsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
