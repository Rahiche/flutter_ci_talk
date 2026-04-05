import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});
  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
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
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.star, size: 48), SizedBox(height: 8), Text('UserAvatar')]);
  }
}
