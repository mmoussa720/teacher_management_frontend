import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';
import 'package:teacher_management_frontend_flutter/app/routes/routes.dart';
import 'package:teacher_management_frontend_flutter/common/drawer_item.dart';
import 'package:teacher_management_frontend_flutter/widgets/drawer/side_bar_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      width: ScreenUtil().setWidth(260),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo_esps.png",
                height: ScreenUtil().setHeight(153),
              ),
            ),
            DrawerItem(
              route: AppRoutes.firstScreen,
              label: 'Dashboard',
              color: Color(0xff14ADD6),
              icon: "dashboard.svg",
            ),
            DrawerItem(
              route: AppRoutes.secondScreen,
              label: "Teachers",
              color: Colors.black,
              icon: "teachers.svg",
            ),
            DrawerItem(
              route: AppRoutes.thirdScreen,
              label: "Groups",
              color: Colors.black,
              icon: "groups.svg",
            ),
            DrawerItem(
              route: AppRoutes.fourthScreen,
              label: "Payment Requests",
              color: Colors.black,
              icon: "payment.svg",
            ),
          ],
        ),
      ),
    );
  }
}
