import 'package:flutter/material.dart';

class ReceiptView extends StatefulWidget {
  const ReceiptView({super.key});
  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    return const Padding(padding: EdgeInsets.all(16), child: Column(children: [Text('ReceiptView', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), SizedBox(height: 16), Text('Content goes here')]));
  }
}
