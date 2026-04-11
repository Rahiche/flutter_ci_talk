import 'package:flutter/material.dart';

class WalletBalance extends StatefulWidget {
  const WalletBalance({super.key});
  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
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
    return ListView(children: const [ListTile(title: Text('Item 1')), ListTile(title: Text('Item 2')), ListTile(title: Text('Item 3'))]);
  }
}
