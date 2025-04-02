import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';

class ReusableTextFormField extends StatelessWidget {
  final String hintText;
  final double fonsize;
  final double width;
  final double height;
  final bool? obscured;
  final String? value;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const ReusableTextFormField({
    super.key,
    required this.hintText,
    required this.fonsize,
    required this.width,
    required this.height,
    this.value,
    this.obscured,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        initialValue: value, // Set the initial value for the field
        onSaved: onSaved, // Save the value using the provided onSaved function
        validator: validator, // Validate using the provided validator
        obscureText:
            obscured ??
            false, // Handle the obscured behavior (for password fields)
        decoration: InputDecoration(
          hintText: hintText, // Display the hint text
          hintStyle: AppStyle(
            size: fonsize,
            weight: FontWeight.w400,
            fontColor: Color(0xffA3A3A3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(width: 1, color: Color(0xffD0D0D0)),
          ),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}
