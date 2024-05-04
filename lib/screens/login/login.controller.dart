import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/screens/login/dto/login.request.dart';
import 'package:id_rumbuk_app/screens/login/login.service.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthController _authController;

  final loginButtonNotifier = ValueNotifier<ButtonState>(ButtonState.initial);
  final passwordObscure = ValueNotifier<bool>(false);

  //var _isLoading = false;

  Future<void> login(String emailOrStudentId, String password) async {
    loginButtonNotifier.value = ButtonState.loading;
    final response = await _loginService.fetchLogin(
        LoginRequest(emailOrStudentId: emailOrStudentId, password: password));

    if (response != null) {
      _authController.login(response);
      loginButtonNotifier.value = ButtonState.done;
    } else {
      Get.defaultDialog(
        middleText: 'User not found!',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
      loginButtonNotifier.value = ButtonState.done;
    }

    // await Future.delayed(const Duration(seconds: 3),
    //     () => loginButtonNotifier.value = ButtonState.done);
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
