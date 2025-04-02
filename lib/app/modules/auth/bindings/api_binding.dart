import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/helpers/api_helper.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioHelper>(() => DioHelper(baseUrl: "http:/localhost:5000"));
  }
}
