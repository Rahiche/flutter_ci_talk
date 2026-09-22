import 'package:flutter/material.dart';

import 'profile_models.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.item, this.onTap});

  final ProfileItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key, required this.state});

  final ProfileState state;

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
            itemBuilder: (_, i) => ProfileTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
