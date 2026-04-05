import 'package:flutter/material.dart';

class SegmentPicker extends StatefulWidget {
  const SegmentPicker({super.key});
  @override
  State<SegmentPicker> createState() => _SegmentPickerState();
}

class _SegmentPickerState extends State<SegmentPicker> {
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
    return const Card(child: Padding(padding: EdgeInsets.all(16), child: Text('SegmentPicker')));
  }
}
