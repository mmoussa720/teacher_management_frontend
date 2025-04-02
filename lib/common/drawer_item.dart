import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/common/app_style.dart';
import 'package:teacher_management_frontend_flutter/config/theme/app_colors.dart';
import 'package:teacher_management_frontend_flutter/widgets/drawer/side_bar_controller.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final Color color;
  final String icon;
  final String route;
  const DrawerItem({
    super.key,
    required this.label,
    required this.color,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SideBarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover:
          (hovering) =>
              hovering
                  ? menuController.changeHoverItem(route)
                  : menuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            tileColor:
                menuController.isActive(route) ? Color(0xffF2F7FF) : null,
            hoverColor: Color(0xffF2F7FF),
            leading:
                menuController.isActive(route)
                    ? SvgPicture.asset(
                      "assets/vectors/icons/$icon",
                    ).gradient(gradient: primaryGradient)
                    : SvgPicture.asset("assets/vectors/icons/$icon"),
            title: Text(
              label,
              style: AppStyle(
                size: 14,
                weight: FontWeight.w400,
                fontColor:
                    menuController.isActive(route)
                        ? Color(0xff14ADD6)
                        : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension Extension on Widget {
  gradient({required Gradient gradient}) => ShaderMask(
    blendMode: BlendMode.srcIn,
    shaderCallback:
        (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
    child: this,
  );
}
