import 'package:flutter/material.dart';

import 'onboarding_models.dart';

class OnboardingTile extends StatelessWidget {
  const OnboardingTile({super.key, required this.item, this.onTap});

  final OnboardingItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class OnboardingListView extends StatelessWidget {
  const OnboardingListView({super.key, required this.state});

  final OnboardingState state;

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
            itemBuilder: (_, i) => OnboardingTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
