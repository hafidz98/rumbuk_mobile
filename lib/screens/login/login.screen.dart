import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/screens/login/login.controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.put(LoginController());

  final _userIdentityFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //bool _passwordObscure = true;

  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 3),
      () => setState(() => _isLoading = false),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userIdentityFieldController.dispose();
    _passwordFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = FilledButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                const Expanded(
                    flex: 1, child: Center(child: Text('Rumbuk App'))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black26),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            'Silakan masuk untuk meminjaman ruangan'),
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
                        Row(
                          children: [
                            const Text('Lupa kata sandi?',
                                style: TextStyle(color: Colors.black54)),
                            TextButton(
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                      const SnackBar(content: Text("Oke"))),
                              style: TextButton.styleFrom(),
                              child: const Text('Ubah kata sandi'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
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
                                if (_formKey.currentState?.validate() ?? false) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (buttonState == ButtonState.initial) {
                                    await _controller.login(_userIdentityFieldController.text, _passwordFieldController.text);
                                  }
                                }
                              },
                              style: style,
                              child: (buttonState == ButtonState.loading)
                                  ? Container(
                                      width: 24,
                                      height: 24,
                                      padding: const EdgeInsets.all(2.0),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                    )
                                  : const Text('Masuk',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: .5)),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(style: TextStyle(color: Colors.black38), 'ver1.0.0'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
