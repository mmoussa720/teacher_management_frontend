import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:teacher_management_frontend_flutter/app/data/login/models/login_model.dart';
import 'package:teacher_management_frontend_flutter/helpers/api_helper.dart';
import 'package:localstorage/localstorage.dart';

class LoginService {
  final DioHelper dioHelper;
  LoginService({required this.dioHelper});
  Future<bool> login(LoginModel loginModel) async {
    try {
      final response = await dioHelper.post(
        '/auth/login',
        data: loginModel.toJson(),
      );
      if (response.statusCode == 201) {
        await _storeTokens(response.data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Login failed: $e");
      return false;
    }
  }
  Future<void> _storeTokens(Map<String, dynamic> data) async {
    if (_isWeb()) {
      localStorage.setItem('access_token', data['accessToken']);
      localStorage.setItem('refresh_token', data['refreshToken']);
      print(localStorage.getItem('access_token'));
    } else {
      final secureStorage = FlutterSecureStorage();
      await secureStorage.write(
        key: 'access_token',
        value: data['accessToken'],
      );
      await secureStorage.write(
        key: 'refresh_token',
        value: data['refreshToken'],
      );
    }
  }
  bool _isWeb() {
    return identical(
      0,
      0.0,
    );
  }
}
