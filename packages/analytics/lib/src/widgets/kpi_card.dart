import 'package:flutter/material.dart';

class KpiCard extends StatelessWidget {
  const KpiCard({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(16), child: Column(children: [Text('KpiCard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), SizedBox(height: 16), Text('Content goes here')]));
  }
}
