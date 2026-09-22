import 'package:flutter/material.dart';

import 'invoices_models.dart';

class InvoicesTile extends StatelessWidget {
  const InvoicesTile({super.key, required this.item, this.onTap});

  final InvoicesItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class InvoicesListView extends StatelessWidget {
  const InvoicesListView({super.key, required this.state});

  final InvoicesState state;

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
            itemBuilder: (_, i) => InvoicesTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
