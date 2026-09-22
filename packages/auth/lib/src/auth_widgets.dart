import 'package:flutter/material.dart';

import 'auth_models.dart';

class AuthTile extends StatelessWidget {
  const AuthTile({super.key, required this.item, this.onTap});

  final AuthItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class AuthListView extends StatelessWidget {
  const AuthListView({super.key, required this.state});

  final AuthState state;

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
            itemBuilder: (_, i) => AuthTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
