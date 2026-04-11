import 'package:flutter/material.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});
  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
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
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.star, size: 48), SizedBox(height: 8), Text('DateRangePicker')]);
  }
}
