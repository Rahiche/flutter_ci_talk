import 'package:flutter/material.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(16), child: Column(children: [Text('InvoiceCard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), SizedBox(height: 16), Text('Content goes here')]));
  }
}
