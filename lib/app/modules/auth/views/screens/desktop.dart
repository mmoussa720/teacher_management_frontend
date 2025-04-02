import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_management_frontend_flutter/app/modules/auth/views/widget/form.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';
import 'package:teacher_management_frontend_flutter/common/spacers/hight_spacer.dart';

class AuthDesktop extends StatelessWidget {
  const AuthDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 200),
              child: Expanded(
                flex: 1,
                child: SelectionArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/logo_esps.png", height: 73),
                          HighSpacer(size: 67),
                          Text(
                            'welcome back!!',
                            style: AppStyle(
                              size: 14.sp,
                              weight: FontWeight.normal,
                              fontColor: Color(0Xff383838),
                            ),
                          ),
                          Text(
                            'Please Sign In',
                            style: AppStyle(
                              size: 28,
                              weight: FontWeight.w900,
                              fontColor: Color(0xff272525),
                            ),
                          ),
                        ],
                      ),
                      LoginForm()
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                height: MediaQuery.of(context).size.height,
                "assets/images/login_background.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}