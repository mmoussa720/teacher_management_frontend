import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/app/routes/app_pages.dart';
import 'package:teacher_management_frontend_flutter/app/routes/routes.dart';
import 'package:teacher_management_frontend_flutter/widgets/drawer/side_bar_controller.dart';

class RouteObserver extends GetObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sideBarController = Get.put(SideBarController());
    if (previousRoute != null) {
      for (var routeName in AppRoutes.sideBarItems) {
        if (previousRoute.settings.name == routeName) {
          sideBarController.activeItem.value = routeName;
        }
      }
    }
  }
}
