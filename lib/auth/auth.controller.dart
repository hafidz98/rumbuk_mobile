import 'package:get/get.dart';
import 'cache.controller.dart';

class AuthController extends GetxController with CacheController {
  final isLogged = false.obs;

  void logOut(){
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus(){
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}

