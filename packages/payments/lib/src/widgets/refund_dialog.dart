import 'package:flutter/material.dart';

class RefundDialog extends StatefulWidget {
  const RefundDialog({super.key});
  @override
  State<RefundDialog> createState() => _RefundDialogState();
}

class _RefundDialogState extends State<RefundDialog> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 35), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    return const Card(child: Padding(padding: EdgeInsets.all(16), child: Text('RefundDialog')));
  }
}
