import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.local.controller.dart';
import 'package:id_rumbuk_app/screens/home/home.controller.dart';
import 'cache.controller.dart';

class AuthController extends GetxController with CacheController {
  late final AuthLocalController _authLocalController;
  //late final HomeController _homeController;

  final isLogged = false.obs;
  final isPINActive = false.obs;
  final isUnlock = false.obs;

  void logOut() {
    isLogged.value = false;
    isPINActive.value = false;
    isUnlock.value = false;
    removeToken();
    removeFingerprint();
    removePIN();
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

  void removePINAuth(BuildContext context) {}

  void activePINAuth(BuildContext context) {
    if (isPINActive.value) {
      screenLock(
        title: const Text('Masukkan PIN untuk menonaktifkan'),
        context: context,
        correctString: getPIN().toString(),
        onUnlocked: () {
          removePIN();
          isPINActive.value = false;
          Get.back();
          //isUnlock.value = false;
          //Navigator.of(context).pop();
        },
      );
    } else {
      screenLockCreate(
        context: Get.context!,
        onConfirmed: (pinValue) {
          savePIN(pinValue);
          isPINActive.value = true;
          isUnlock.value = true;
          if (kDebugMode) {
            print(isLogged.value);
          }
          Get.back();
        },
        title: const Text('Masukkan PIN baru'),
        confirmTitle: const Text('Konfirmasi PIN baru'),
      );
    }
  }

  Future<void> unlock(BuildContext context) async {
    if (isPINActive.value) {
      screenLock(
        title: const Text('Masukkan PIN'),
        context: context,
        correctString: getPIN().toString(),
        onUnlocked: () {
          isUnlock.value = true;
          Get.back();
        },
        // customizedButtonChild: const Icon(
        //   Icons.fingerprint,
        // ),
        // customizedButtonTap: () => _authLocalController.authFingerprint(),
        // onOpened: () async {
        //   await _authLocalController.authFingerprint(context)
        //       ? isUnlock.value = true
        //       : false;
        // },
        canCancel: false,
      );
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _authLocalController = Get.put(AuthLocalController());
    isUnlock.value = false;
    // _homeController = Get.put(HomeController());
    //
    // await _homeController.getStudent();
    // await _homeController.getReservation();
  }

  @override
  void onClose() {
    isUnlock.value = false;
  }
}
