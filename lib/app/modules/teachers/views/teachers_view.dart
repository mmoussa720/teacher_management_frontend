import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/responsive_template.dart';

import '../controllers/teachers_controller.dart';

class TeachersView extends GetView<TeachersController> {
  const TeachersView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Center(
        child: Text('TeachersView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
