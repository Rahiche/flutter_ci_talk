import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.star, size: 48), SizedBox(height: 8), Text('EventList')]);
  }
}
