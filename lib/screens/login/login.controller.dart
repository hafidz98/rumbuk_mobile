import 'package:flutter/material.dart';

class LoginScreenController {
  final loginButtonNotifier = ValueNotifier<ButtonState>(ButtonState.initial);
  final passwordObscure = ValueNotifier<bool>(false);

  //var _isLoading = false;

  Future<void> login() async{
    loginButtonNotifier.value = ButtonState.loading;
    await Future.delayed(const Duration(seconds: 3), () => loginButtonNotifier.value = ButtonState.done);
  }




  void obscurePassword(){
    passwordObscure.value = !passwordObscure.value;
  }
}

enum ButtonState {
  initial,
  loading,
  done,
}
