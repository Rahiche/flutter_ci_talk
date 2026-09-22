import 'package:flutter/material.dart';

import 'chat_models.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.item, this.onTap});

  final ChatItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        key: ValueKey('tile-${item.id}'),
        title: Text(item.label),
        subtitle: Text('${item.amount}'),
        onTap: onTap,
      );
}

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.state});

  final ChatState state;

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
            itemBuilder: (_, i) => ChatTile(item: state.items[i]),
          ),
        ),
      ],
    );
  }
}
