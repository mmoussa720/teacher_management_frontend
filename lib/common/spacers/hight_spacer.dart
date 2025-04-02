import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HighSpacer extends StatelessWidget {
  final double size;
  const HighSpacer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ScreenUtil().setHeight(size));
  }
}
