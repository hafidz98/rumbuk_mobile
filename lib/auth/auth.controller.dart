import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.local.controller.dart';
import 'cache.controller.dart';

class AuthController extends GetxController with CacheController {
  late final AuthLocalController _authLocalController;

  final isLogged = false.obs;
  var isPINActive = false.obs;
  var isUnlock = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token, studentId) async {
    isLogged.value = true;
    await saveToken(token);
    await saveStudentId(studentId);
  }

  String? getStudentIdFromBox() {
    final studentId = getStudentId();
    if (studentId != null) {
      return studentId;
    }
    return "";
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  void changePINStatus() {
    final pin = getPIN();
    if (pin != null) {
      isPINActive.value = true;
    } else {
      isPINActive.value = false;
    }
  }

  void checkPINStatus() {
    final pin = getPIN();
    if (pin != null) {
      isPINActive.value = true;
    }
  }

  void activePINAuth(BuildContext context) {
    if (isPINActive.value) {
      screenLock(
        title: const Text('Masukkan PIN untuk menonaktifkan'),
        context: context,
        correctString: getPIN().toString(),
        onUnlocked: () {
          removePIN();
          isPINActive.value = false;
          isUnlock.value = false;
          //Navigator.of(context).pop();
        },
      );
    } else {
      screenLockCreate(
        context: context,
        onConfirmed: (pinValue) {
          savePIN(pinValue);
          isPINActive.value = true;
          isUnlock.value = true;
          if (kDebugMode) {
            print(isLogged.value);
          }
          //Navigator.of(context).pop();
        },
        title: const Text('Masukkan PIN baru'),
        confirmTitle: const Text('Konfirmasi PIN baru'),
      );
    }
  }

  Future<void> unlock(BuildContext context) async {
    if (isPINActive.value || _authLocalController.isFingerprintActive.value) {
      screenLock(
        title: const Text('Masukkan PIN'),
        context: context,
        correctString: getPIN().toString(),
        onUnlocked: () {
          isUnlock.value = true;
          Navigator.of(context).pop();
        },
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    _authLocalController = Get.put(AuthLocalController());
  }
}
