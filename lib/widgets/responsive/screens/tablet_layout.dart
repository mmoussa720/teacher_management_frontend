import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body ?? const SizedBox());
  }
}
