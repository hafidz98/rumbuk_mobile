import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/cache.controller.dart';
import 'package:local_auth/local_auth.dart';

class AuthLocalController extends GetxController with CacheController {
  final _auth = LocalAuthentication();
  var isFingerprintActive = false.obs;

  Future<bool> _hasBiometrics() async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }

  Future<bool> authFingerprint(BuildContext context) async {
    if (isFingerprintActive.value) {
      final isAuthenticated = await _auth.authenticate(
          localizedReason: 'Pindai sidik jari untuk otentikasi',
          options: const AuthenticationOptions(biometricOnly: true));
      if (isAuthenticated && context.mounted) {
        Get.back;
        return true;
      }
    }
    return false;
  }

  Future<bool> authenticate() async {
    final isAuthAvailable = await _hasBiometrics();
    if (!isAuthAvailable) return false;
    try {
      bool isAuthenticated = await _auth.authenticate(
          localizedReason: 'Pindai sidik jari untuk otentikasi',
          options: const AuthenticationOptions(biometricOnly: true));
      return isAuthenticated;
    } catch (e) {
      return false;
    }
  }

  void checkFingerprintStatus() {
    final fp = getFingerprint();
    if (fp != null) {
      isFingerprintActive.value = true;
    }
  }

  void _changeFingerprintStatus() {
    final fp = getFingerprint();
    if (fp != null) {
      isFingerprintActive.value = true;
    } else {
      isFingerprintActive.value = false;
    }
  }

  Future<void> activeFpAuth() async {
    bool status = await authenticate();
    if (isFingerprintActive.value && status) {
      removeFingerprint();
      _changeFingerprintStatus();
      printInfo(info: '${isFingerprintActive.value}, disable');
    } else {
      if (status) {
        saveFingerprint();
        _changeFingerprintStatus();
      }
      printInfo(info: '${isFingerprintActive.value}, enable');
    }
  }

  @override
  void onInit() {
    super.onInit();
    _changeFingerprintStatus();
  }
}
