import 'package:flutter/material.dart';
import 'package:id_rumbuk_app/screens/home.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart';
import 'package:id_rumbuk_app/screens/profile.dart';
import 'package:id_rumbuk_app/screens/reservation.dart';
import 'package:id_rumbuk_app/screens/status.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb &&
      kDebugMode &&
      defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rumbuk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: const [HomeScreen(),ReservationScreen(), StatusScreen(), ProfileScreen()][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
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
      ),
    );
  }
}
