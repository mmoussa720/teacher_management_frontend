import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/app/modules/auth/views/screens/desktop.dart';
import 'package:teacher_management_frontend_flutter/app/modules/auth/views/screens/mobile.dart';

import 'package:teacher_management_frontend_flutter/widgets/responsive/responsive_template.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: AuthDesktop(),
      mobile: AuthMobile(),
      useLayout: false,
    );
  }
}
