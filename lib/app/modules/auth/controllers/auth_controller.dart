import 'package:get/get.dart';
import 'package:teacher_management_frontend_flutter/app/data/services/login_service.dart';
import 'package:teacher_management_frontend_flutter/app/data/login/models/login_model.dart';

class AuthController extends GetxController {
  var cin = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var loginError = ''.obs;
  final LoginService loginService;
  AuthController({required this.loginService});
  Future<void> login() async {
    isLoading.value = true;
    loginError.value = '';
    final success = await loginService.login(
      LoginModel(cin: cin.value, password: password.value),
    );
    if (success) {
      print("Success");
    } else {
      loginError.value = 'Invalid email or password';
    }
    isLoading.value = false;
  }
}
