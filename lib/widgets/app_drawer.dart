import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      width: ScreenUtil().setWidth(260),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo_esps.png",
                height: ScreenUtil().setHeight(153),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
