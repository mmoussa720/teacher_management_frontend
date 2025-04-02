import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_management_frontend_flutter/app/modules/auth/controllers/auth_controller.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';
import 'package:teacher_management_frontend_flutter/common/spacers/hight_spacer.dart';
import 'package:teacher_management_frontend_flutter/common/spacers/width_spacer.dart';
import 'package:teacher_management_frontend_flutter/common/text_fields/reusable_text_form_field.dart';
import 'package:teacher_management_frontend_flutter/config/theme/app_colors.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Form(
      key: _formKey, // Added key to form for validation
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'National Identity Card Number',
            style: AppStyle(
              size: 14,
              weight: FontWeight.w400,
              fontColor: Color(0xff121212),
            ),
          ),
          const HighSpacer(size: 10),
          ReusableTextFormField(
            value: authController.cin.value, // Bind to the controller's cin
            onSaved: (value) => authController.cin.value = value ?? '',
            hintText: "Enter your National Identity Card Number",
            fonsize: 14,
            width: 350,
            height: 50,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your CIN';
              }
              return null;
            },
          ),
          const HighSpacer(size: 24),
          Text(
            'Password',
            style: AppStyle(
              size: 14,
              weight: FontWeight.w400,
              fontColor: Color(0xff121212),
            ),
          ),
          const HighSpacer(size: 10),
          ReusableTextFormField(
            value: authController.password.value,
            onSaved: (value) => authController.password.value = value ?? '',
            obscured: true,
            hintText: "Enter your password",
            fonsize: 14,
            width: 350,
            height: 50,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text(
                "Remember me",
                style: AppStyle(
                  size: 14,
                  weight: FontWeight.normal,
                  fontColor: Color(0xff515151),
                ),
              ),
              const WidthSpacer(size: 76),
              Text(
                "Forget Password ?",
                style: AppStyle(
                  size: 14,
                  weight: FontWeight.normal,
                  fontColor: Color(0xff14ADD6),
                ),
              ),
            ],
          ),
          const HighSpacer(size: 48),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                authController.login(); 
              }
            },
            child: Container(
              width: ScreenUtil().setWidth(350),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: primaryGradient,
              ),
              child: Center(
                child: const Text(
                  "Sign in",
                  style: AppStyle(
                    size: 14,
                    weight: FontWeight.w400,
                    fontColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
