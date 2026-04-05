import 'package:flutter/material.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [ListTile(title: Text('Item 1')), ListTile(title: Text('Item 2')), ListTile(title: Text('Item 3'))]);
  }
}
