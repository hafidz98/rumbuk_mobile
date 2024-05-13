import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/screens/login/dto/login.request.dart';
import 'package:id_rumbuk_app/screens/login/login.service.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthController _authController;

  final loginButtonNotifier = ValueNotifier<ButtonState>(ButtonState.initial);
  final passwordObscure = ValueNotifier<bool>(false);

  Future<void> login(String emailOrStudentId, String password) async {
    loginButtonNotifier.value = ButtonState.loading;
    final response = await _loginService.fetchLogin(
        LoginRequest(emailOrStudentId: emailOrStudentId, password: password));

    if (response != null) {
      _authController.login(response.token, response.studentId);
      loginButtonNotifier.value = ButtonState.done;
      // const SnackBar(
      //     behavior: SnackBarBehavior.floating, content: Text('Berhasil login'));
    } else {
      Get.defaultDialog(
        middleText: 'User not found!',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
      loginButtonNotifier.value = ButtonState.initial;
    }
  }

  void obscurePassword() {
    passwordObscure.value = !passwordObscure.value;
  }

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authController = Get.find();
  }
}

enum ButtonState {
  initial,
  loading,
  done,
}
