import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart';
import 'package:id_rumbuk_app/screens/login/login.screen.dart';
import 'package:id_rumbuk_app/screens/main_screen.dart';
import 'package:id_rumbuk_app/theme/theme.dart';
import 'package:intl/date_symbol_data_local.dart';

// import 'package:id_rumbuk_app/auth/auth.local.controller.dart';
// import 'package:id_rumbuk_app/screens/home/home.controller.dart';

// import 'package:id_rumbuk_app/screens/home/home.screen.dart';
// import 'package:id_rumbuk_app/screens/profile/profile.dart';
// import 'package:id_rumbuk_app/screens/reservation/reservation.screen.dart';
// import 'package:id_rumbuk_app/screens/status/status.screen.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb &&
      kDebugMode &&
      defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  await initializeDateFormatting('id_ID', null);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  //runApp(const LoginScreen());
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController _authController = Get.put(AuthController());

  // final HomeController _controller = Get.put(HomeController());
  // final AuthLocalController _authLocalController =
  //     Get.put(AuthLocalController());

  @override
  void initState() {
    super.initState();
    initializeSettings();
  }

  Future<void> initializeSettings() async {
    _authController.checkLoginStatus();
    // _authController.checkPINStatus();
    // _authLocalController.checkFingerprintStatus();
    // await _controller.getStudent();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // if (_authController.isPINActive.value && !_authController.isUnlock.value) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     _authController.unlock(context);
    //   });
    // }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rumbuk',
      theme: TAppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            if (snapshot.hasError) {
              return Obx(
                () => Scaffold(
                    body: Center(child: Text('Error: ${snapshot.error}'))),
              );
            }
            return Obx(
              () => _authController.isLogged.value
                  ? const MainScreen()
                  : const LoginScreen(),
            );
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int selectedPageIndex = 0;
//   final AuthController _authController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     if (_authController.isPINActive.value && !_authController.isUnlock.value) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _authController.unlock(context);
//       });
//     }
//     return Scaffold(
//       body: [
//         HomeScreen(),
//         ReservationScreen(),
//         const StatusScreen(),
//         ProfileScreen()
//       ][selectedPageIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Theme.of(context).colorScheme.primary,
//         currentIndex: selectedPageIndex,
//         onTap: (value) {
//           setState(() {
//             selectedPageIndex = value;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Reservasi',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Status',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_pin),
//             label: 'Profil',
//           ),
//         ],
//       ),
//       // bottomNavigationBar: NavigationBar(
//       //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//       //   height: MediaQuery.of(context).size.height * 0.09,
//       //   destinations: const <NavigationDestination>[
//       //     NavigationDestination(
//       //       selectedIcon: Icon(Icons.home),
//       //       icon: Icon(Icons.home_outlined),
//       //       label: 'Beranda',
//       //     ),
//       //     NavigationDestination(
//       //       selectedIcon: Icon(Icons.book_rounded),
//       //       icon: Icon(Icons.book_outlined),
//       //       label: 'Reservasi',
//       //     ),
//       //     NavigationDestination(
//       //       selectedIcon: Icon(Icons.circle_notifications_rounded),
//       //       icon: Icon(Icons.circle_notifications_outlined),
//       //       label: 'Status',
//       //     ),
//       //     NavigationDestination(
//       //       selectedIcon: Icon(Icons.person),
//       //       icon: Icon(Icons.person_outline),
//       //       label: 'Profil',
//       //     ),
//       //   ],
//       //   selectedIndex: selectedPageIndex,
//       //   onDestinationSelected: (value) {
//       //     setState(() {
//       //       selectedPageIndex = value;
//       //     });
//       //   },
//       // ),
//     );
//   }
// }

//todo: invalid or expired token refresh
