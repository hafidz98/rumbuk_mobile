import 'package:get/get.dart';
import 'cache.controller.dart';

class AuthController extends GetxController with CacheController {
  final isLogged = false.obs;

  void logOut(){
    isLogged.value = false;
    removeToken();
  }

  void login(String? token, studentId) async {
    isLogged.value = true;
    await saveToken(token);
    await saveStudentId(studentId);
  }

  String? getStudentIdFromBox(){
    final studentId = getStudentId();
    if(studentId != null){
      return studentId;
    }
    return "";
  }

  void checkLoginStatus(){
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}

