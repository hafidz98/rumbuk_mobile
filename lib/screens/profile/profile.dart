import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/auth/auth.local.controller.dart';
import 'package:id_rumbuk_app/screens/profile/profile.controller.dart';
import 'package:id_rumbuk_app/screens/profile/profile_detail.dart';
import 'package:id_rumbuk_app/widgets/simple_user_profile.widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileDetailScreen()),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => SimpleUserProfile(
                            profileImageUrl: 'https://picsum.photos/200',
                            profileUsername:
                                controller.studentData.value.name ??
                                    'studentName',
                            profileUserID:
                                controller.studentData.value.studentId ??
                                    'studentId'),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 24),
              const Text('Keamanan aplikasi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              const _PasscodeWidget(),
              const SizedBox(height: 4),
              const _FingerprintWidget(),
              const Divider(height: 24),
              TextButton(
                  style: ButtonStyle(
                      splashFactory: InkSplash.splashFactory,
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  onPressed: () {},
                  child: const Text(
                    'Keluar',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasscodeWidget extends StatelessWidget {
  const _PasscodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Passcode(PIN)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Obx(
          () => Switch(
            value: authController.isPINActive.value,
            onChanged: (value) {
              authController.activePINAuth(context);
            },
          ),
        ),
      ],
    );
  }
}

class _FingerprintWidget extends StatelessWidget {
  const _FingerprintWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthLocalController authLocalController = Get.put(AuthLocalController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Fingerprint',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Obx(
          () {
            return Switch(
              value: authLocalController.isFingerprintActive.value,
              onChanged: (value) {
                authLocalController.activeFpAuth();
              },
            );
          },
        ),
      ],
    );
  }
}
