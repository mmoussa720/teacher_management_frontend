import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/app/data/services/login_service.dart';
import 'package:teacher_management_frontend_flutter/helpers/api_helper.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioHelper>(() => DioHelper(baseUrl: "http://localhost:5000"));
    Get.lazyPut<LoginService>(
      () => LoginService(dioHelper: Get.find<DioHelper>()),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(loginService: Get.find<LoginService>()),
    );
  }
}

