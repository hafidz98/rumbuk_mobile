import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/screens/login/login.controller.dart';
import 'package:id_rumbuk_app/widgets/custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.put(LoginController());
  //final AuthController _authController = Get.find();

  final _userIdentityFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userIdentityFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style = FilledButton.styleFrom(
    //   textStyle: const TextStyle(fontSize: 20),
    //   minimumSize: const Size.fromHeight(50),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    // );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            physics:
                ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 300,
                      child: Image(
                        image: AssetImage(
                          'assets/image/login_img2.jpg',
                        ),
                        fit: BoxFit.fitWidth,
                        width: 300,
                      ),
                    ),
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: Theme.of(context).textTheme.headlineSmall,
                            'Silakan masuk\nuntuk meminjaman ruangan'),
                        const SizedBox(height: 36),
                        TextFormField(
                          validator: (value) => (value == null || value.isEmpty)
                              ? '*mohon isi identitas anda'
                              : null,
                          controller: _userIdentityFieldController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan NPM atau Surel anda',
                              labelText: 'NPM atau Surel'),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          validator: (value) => (value == null || value.isEmpty)
                              ? '*mohon isi kata sandi anda'
                              : null,
                          controller: _passwordFieldController,
                          obscureText: _controller.passwordObscure.value,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Masukkan kata sandi anda',
                              suffixIcon: IconButton(
                                  style: const ButtonStyle(
                                      splashFactory: NoSplash.splashFactory),
                                  onPressed: () => setState(
                                      () => _controller.obscurePassword()),
                                  icon: Icon(_controller.passwordObscure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              labelText: 'Kata sandi'),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // const Text('Lupa kata sandi?',
                            //     style: TextStyle(color: Colors.black54)),
                            TextButton(
                              onPressed: () => CustomSnackBar.of(context)
                                  .customSnackBar('Akan di implementasi'),
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black),
                              child: const Text(
                                'Lupa kata sandi?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        ValueListenableBuilder<ButtonState>(
                          valueListenable: _controller.loginButtonNotifier,
                          builder: (BuildContext context, buttonState,
                              Widget? child) {
                            return FilledButton(
                              onPressed: () async {
                                const snackBar = SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Berhasil login'),
                                );
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (buttonState == ButtonState.initial) {
                                    await _controller.login(
                                        _userIdentityFieldController.text,
                                        _passwordFieldController.text);
                                    snackBar;
                                  }
                                }
                              },
                              child: (buttonState == ButtonState.loading)
                                  ? Container(
                                      width: 24,
                                      height: 24,
                                      padding: const EdgeInsets.all(2.0),
                                      child: const CircularProgressIndicator(
                                          color: Colors.white, strokeWidth: 3),
                                    )
                                  : const Text('Masuk'),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  // Text(
                  //     style: Theme.of(context).textTheme.bodySmall,
                  //     'ver1.0.0'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
