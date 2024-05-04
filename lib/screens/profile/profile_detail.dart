import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Profil'), elevation: 8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Info Akun',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Zentradi Bautista',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                  Text(
                    'Laki-laki',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                  Text(
                    'mail@campus.ac.id',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              TextButton(
                  style: ButtonStyle(
                      splashFactory: InkSplash.splashFactory,
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  onPressed: () {},
                  child: const Text(
                    'Ganti kata sandi',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 16),
              const Text(
                'Akademik',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NPM',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '20240030',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                  Text(
                    '2024',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                  Text(
                    'Teknik Angkasa',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                  Text(
                    'Teknik Luar Angkasa',
                    style: Theme.of(context).textTheme.bodyLarge,
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
