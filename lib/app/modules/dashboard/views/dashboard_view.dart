import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/app/modules/dashboard/views/screens/dashboard_desktop.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/responsive_template.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(desktop:DashboardDesktop(),);
  }
}
