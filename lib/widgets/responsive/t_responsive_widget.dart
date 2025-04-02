import 'package:flutter/material.dart';
import 'package:teacher_management_frontend_flutter/common/constants/sizes.dart';

class TResponsiveWidget extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  const TResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constaints) {
        if (constaints.maxWidth >= Sizes.desktopSize) {
          return desktop;
        } else if (constaints.maxWidth < Sizes.desktopSize &&
            constaints.maxWidth >= Sizes.tabletSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
