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

    try {
      final response = await _loginService.fetchLogin(
          LoginRequest(emailOrStudentId: emailOrStudentId, password: password));
      if (response != null && response is! String) {
        _authController.login(response.token, response.studentId);
        loginButtonNotifier.value = ButtonState.initial;
        // const SnackBar(
        //     behavior: SnackBarBehavior.floating, content: Text('Berhasil login'));
      } else {
        // Get.defaultDialog(
        //   middleText: 'User not found!',
        //   textConfirm: 'OK',
        //   confirmTextColor: Colors.white,
        //   onConfirm: () {
        //     Get.back();
        //   },
        // );
        loginButtonNotifier.value = ButtonState.initial;
        throw 'ID atau kata sandi salah';
      }
    } catch (e) {
      Get.back();
      loginButtonNotifier.value = ButtonState.initial;
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  '$e',
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            )),
      );

      // error
      // showDialog(
      //   context: Get.context!,
      //   builder: (context) => SnackBar(
      //       behavior: SnackBarBehavior.floating,
      //       content: Text(
      //         e.toString(),
      //         style: Theme.of(Get.context!).textTheme.bodySmall,
      //       )),
      // );

      // Get.showSnackbar(GetSnackBar(
      //   snackStyle: SnackStyle.FLOATING,
      //   title: 'Perhatian',
      //   messageText: Text(
      //     e.toString(),
      //     style: Theme.of(Get.context!).textTheme.bodySmall,
      //   ),
      // ));

      // showDialog(
      //   context: Get.context!,
      //   builder: (context) {
      //     return SimpleDialog(
      //       title: const Text('Error'),
      //       contentPadding: const EdgeInsets.all(20),
      //       children: [Text(e.toString())],
      //     );
      //   },
      // );
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
    obscurePassword();
  }
}

enum ButtonState {
  initial,
  loading,
  done,
}
