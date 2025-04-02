import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/widgets/responsive/responsive_template.dart';

import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Center(child: Text("Groups Page is working")),
    );
  }
}
