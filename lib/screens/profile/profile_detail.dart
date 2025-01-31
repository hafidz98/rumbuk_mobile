import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/screens/profile/profile.controller.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text('Profil'), elevation: 8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle,size: 100.0,)
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Info Akun',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () => Text(
                      controller.studentData.value.name ?? 'studentName',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () {
                      var gen = controller.studentData.value.gender;
                      switch (gen) {
                        case 'l':
                          gen = 'Laki-laki';
                        case 'p':
                          gen = 'Perempuan';
                        default:
                          gen = 'studentGender';
                      }
                      return Text(
                        gen,
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Surel',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () => Text(
                      controller.studentData.value.email ?? 'studentEmail',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              // TextButton(
              //   style: ButtonStyle(
              //       splashFactory: InkSplash.splashFactory,
              //       visualDensity: VisualDensity.compact,
              //       padding: MaterialStateProperty.all(EdgeInsets.zero)),
              //   onPressed: () {},
              //   child: const Text(
              //     'Ganti kata sandi',
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ),
              const SizedBox(height: 16),
              const Text(
                'Akademik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NPM',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () => Text(
                      controller.studentData.value.studentId ?? 'studentId',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Angkatan',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () => Text(
                      '${controller.studentData.value.batchYear ?? 'batchYear'}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Program Studi',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () => Text(
                      controller.studentData.value.major ?? 'studentMajor',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fakultas',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(
                    () => Text(
                      controller.studentData.value.faculty ?? 'studentFaculty',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
