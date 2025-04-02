import 'package:flutter/material.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/screens/desktop_layout.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/screens/mobile_layout.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/screens/tablet_layout.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/t_responsive_widget.dart';

class ResponsiveTemplate extends StatelessWidget {
  const ResponsiveTemplate({
    super.key,
    this.desktop,
    this.mobile,
    this.tablet,
    this.useLayout = true,
  });
  final Widget? desktop;
  final Widget? mobile;
  final Widget? tablet;
  final bool useLayout;
  @override
  Widget build(BuildContext context) {
    return TResponsiveWidget(
      desktop:
          useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
      mobile:
          useLayout
              ? MobileLayout(body: mobile)
              : desktop ?? desktop ?? Container(),
      tablet:
          useLayout
              ? TabletLayout(body: tablet ?? desktop)
              : tablet ?? desktop ?? Container(),
    );
  }
}
