import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/app/routes/routes.dart';
import 'package:teacher_management_frontend_flutter/common/utils/device_utils.dart';

class SideBarController extends GetxController {
  final activeItem = AppRoutes.firstScreen.obs;
  final hoverItem = ''.obs;
  void changeActiveItem(String route) => activeItem.value = route;
  void changeHoverItem(String route) {
    if (activeItem.value != route) {
      hoverItem.value = route;
    }
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;
  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);
      if (DeviceUtils.isMobileScreen(Get.context!)) {
        Get.back();
      }
      Get.toNamed(route);
    }
  }
}
