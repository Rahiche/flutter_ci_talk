import 'package:flutter/material.dart';

import 'addresses_models.dart';

class AddressesTile extends StatelessWidget {
  const AddressesTile({super.key, required this.item, this.onTap});

  final AddressesItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class AddressesListView extends StatelessWidget {
  const AddressesListView({super.key, required this.state});

  final AddressesState state;

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
            itemBuilder: (_, i) => AddressesTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
