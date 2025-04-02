import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_management_frontend_flutter/app/modules/auth/views/widget/form.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';
import 'package:teacher_management_frontend_flutter/common/spacers/hight_spacer.dart';

class AuthMobile extends StatelessWidget {
  const AuthMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SelectionArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
