import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';
import 'package:teacher_management_frontend_flutter/common/constants/date.dart';
import 'package:teacher_management_frontend_flutter/common/spacers/width_spacer.dart';
import 'package:teacher_management_frontend_flutter/common/utils/device_utils.dart';
import 'package:teacher_management_frontend_flutter/config/theme/app_colors.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primaryColor),
      child: AppBar(
        leading:
            DeviceUtils.isDesktopScreen(context)
                ? Container(width: 1)
                : IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, Mr. Mohamed Moussa",
              style: AppStyle(
                size: 20,
                weight: FontWeight.w900,
                fontColor: Colors.black,
              ),
            ),
            Text(
              "Today is ${weekdays[DateTime.now().weekday - 1]}, ${DateTime.now().day} ${months[DateTime.now().month - 1]} ${DateTime.now().year}",
              style: AppStyle(
                size: 12,
                weight: FontWeight.w400,
                fontColor: Color(0xff262626),
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications),
          WidthSpacer(size: 11),
          CircleAvatar(radius: 15.r),
          WidthSpacer(size: 16),
          SizedBox(
            height: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mohamed Moussa",
                  style: AppStyle(
                    size: 14,
                    weight: FontWeight.w400,
                    fontColor: Color(0xff121212),
                  ),
                ),
                Text(
                  "Admin",
                  style: AppStyle(
                    size: 12,
                    weight: FontWeight.w400,
                    fontColor: Color(0xff515151),
                  ),
                ),
              ],
            ),
          ),
          WidthSpacer(size: 20),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
