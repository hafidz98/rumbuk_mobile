import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/screens/home/home.screen.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart';
import 'package:id_rumbuk_app/screens/login/login.screen.dart';
import 'package:id_rumbuk_app/screens/profile/profile.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.screen.dart';
import 'package:id_rumbuk_app/screens/status/status.screen.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb &&
      kDebugMode &&
      defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    initializeSettings();
  }

  Future<void> initializeSettings() async {
    _authController.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rumbuk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                    Text('Memuat...'),
                  ],
                ),
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')));
            } else {
              return Obx(() => _authController.isLogged.value
                  ? const ScreenHolder()
                  : const LoginScreen());
            }
          }
        },
      ),
    );
  }
}

class ScreenHolder extends StatefulWidget {
  const ScreenHolder({Key? key}) : super(key: key);

  @override
  State<ScreenHolder> createState() => _ScreenHolderState();
}

class _ScreenHolderState extends State<ScreenHolder> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        HomeScreen(),
        ReservationScreen(),
        StatusScreen(),
        ProfileScreen()
      ][selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: MediaQuery.of(context).size.height * 0.09,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book_rounded),
            icon: Icon(Icons.book_outlined),
            label: 'Reservasi',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.circle_notifications_rounded),
            icon: Icon(Icons.circle_notifications_outlined),
            label: 'Status',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedPageIndex = value;
          });
        },
      ),
    );
  }
}
