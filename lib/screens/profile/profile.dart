import 'package:flutter/material.dart';
import 'package:id_rumbuk_app/screens/profile/profile_detail.dart';
import 'package:id_rumbuk_app/widgets/simple_user_profile.widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileDetailScreen()),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: const SimpleUserProfile(
                          profileImageUrl: 'https://picsum.photos/200',
                          profileUsername: 'Adnan Rzifka',
                          profileUserID: '24201003'),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 24),
              const Text('Keamanan aplikasi', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              const SizedBox(height: 8),
              _PasscodeWidget(),
              const SizedBox(height: 4),
              _FingerprintWidget(),
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

class _PasscodeWidget extends StatefulWidget {
  const _PasscodeWidget({Key? key}) : super(key: key);

  @override
  State<_PasscodeWidget> createState() => _PasscodeWidgetState();
}

class _PasscodeWidgetState extends State<_PasscodeWidget> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Passcode(PIN)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Switch(
          value: _isActive,
          onChanged: (value) {
            setState(() {
              _isActive = value;
            });
          },
        )
      ],
    );
  }
}

class _FingerprintWidget extends StatefulWidget {
  const _FingerprintWidget({Key? key}) : super(key: key);

  @override
  State<_FingerprintWidget> createState() => _FingerprintWidgetState();
}

class _FingerprintWidgetState extends State<_FingerprintWidget> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Fingerprint',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Switch(
          value: _isActive,
          onChanged: (value) {
            setState(() {
              _isActive = value;
            });
          },
        )
      ],
    );
  }
}
