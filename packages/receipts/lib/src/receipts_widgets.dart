import 'package:flutter/material.dart';

import 'receipts_models.dart';

class ReceiptsTile extends StatelessWidget {
  const ReceiptsTile({super.key, required this.item, this.onTap});

  final ReceiptsItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class ReceiptsListView extends StatelessWidget {
  const ReceiptsListView({super.key, required this.state});

  final ReceiptsState state;

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
            itemBuilder: (_, i) => ReceiptsTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
