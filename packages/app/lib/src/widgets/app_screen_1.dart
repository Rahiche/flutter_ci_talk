import 'package:flutter/material.dart';

class AppScreen1 extends StatelessWidget {
  const AppScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('AppScreen1', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 16),
          for (int i = 0; i < 5; i++)
            ListTile(title: Text('Item $i'), leading: const Icon(Icons.circle)),
        ],
      ),
    );
  }
}
