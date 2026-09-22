import 'package:flutter/material.dart';

import 'vouchers_models.dart';

class VouchersTile extends StatelessWidget {
  const VouchersTile({super.key, required this.item, this.onTap});

  final VouchersItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class VouchersListView extends StatelessWidget {
  const VouchersListView({super.key, required this.state});

  final VouchersState state;

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
            itemBuilder: (_, i) => VouchersTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
