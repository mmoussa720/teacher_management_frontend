import 'package:flutter/material.dart';
import 'package:teacher_management_frontend_flutter/widgets/drawer/app_drawer.dart';
import 'package:teacher_management_frontend_flutter/widgets/navBar/navBar.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppDrawer(),
          Expanded(
            flex: 5,
            child: Column(children: [NavBar(), body ?? const SizedBox()]),
          ),
        ],
      ),
    );
  }
}
