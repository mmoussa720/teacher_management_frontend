import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:teacher_management_frontend_flutter/config/theme/app_theme.dart';
import 'app/routes/app_pages.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            Size designSize =
                constraints.maxWidth < 600
                    ? const Size(390, 700)
                    : const Size(1440, 700);
            return GetMaterialApp(
              theme: AppTheme.theme,
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              builder: (context, child) {
                ScreenUtil.init(context, designSize: designSize);
                return child!;
              },
            );
          },
        );
      },
    ),
  );
}
