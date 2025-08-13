import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/screens/home/home.screen.dart';
//import 'package:id_rumbuk_app/screens/profile/profile.dart';
import 'package:id_rumbuk_app/screens/profile/profile_detail.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.screen.dart';
import 'package:id_rumbuk_app/screens/status/status.screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int selectedPageIndex = 0;
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_authController.isPINActive.value &&
          !_authController.isUnlock.value) {
        _authController.unlock(context);
      }
    });

    // if (_authController.isPINActive.value && !_authController.isUnlock.value) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     _authController.unlock(context);
    //   });
    // }
    return Scaffold(
      body: [
        HomeScreen(),
        ReservationScreen(),
        const StatusScreen(),
        ProfileDetailScreen()
      ][selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: selectedPageIndex,
        onTap: (value) {
          setState(() {
            selectedPageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Reservasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profil',
          ),
        ],
      ),
      // bottomNavigationBar: NavigationBar(
      //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      //   height: MediaQuery.of(context).size.height * 0.09,
      //   destinations: const <NavigationDestination>[
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.home),
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Beranda',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.book_rounded),
      //       icon: Icon(Icons.book_outlined),
      //       label: 'Reservasi',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.circle_notifications_rounded),
      //       icon: Icon(Icons.circle_notifications_outlined),
      //       label: 'Status',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.person),
      //       icon: Icon(Icons.person_outline),
      //       label: 'Profil',
      //     ),
      //   ],
      //   selectedIndex: selectedPageIndex,
      //   onDestinationSelected: (value) {
      //     setState(() {
      //       selectedPageIndex = value;
      //     });
      //   },
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // if (_authController.isPINActive.value && !_authController.isUnlock.value) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     await _authController.unlock(context);
    //   });
    //   //Future.delayed(Duration.zero, () => _authController.unlock(context),);
    //   //_authController.unlock(context);
    // }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_authController.isPINActive.value &&
          !_authController.isUnlock.value) {
        _authController.unlock(context);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _authController.isUnlock.value = false;
    }
    if (state == AppLifecycleState.resumed) {
      if (_authController.isPINActive.value &&
          !_authController.isUnlock.value) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await _authController.unlock(context);
        });
      }
    }
  }
}
