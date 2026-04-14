import 'package:flutter/material.dart';

class CoreScreen0 extends StatelessWidget {
  const CoreScreen0({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('CoreScreen0', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 16),
          for (int i = 0; i < 5; i++)
            ListTile(title: Text('Item $i'), leading: const Icon(Icons.circle)),
        ],
      ),
    );
  }
}
