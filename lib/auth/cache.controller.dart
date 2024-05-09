import 'package:get_storage/get_storage.dart';

mixin CacheController {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheControllerKey.token.toString(), token);
    return true;
  }

  String? getToken(){
    final box = GetStorage();
    return box.read(CacheControllerKey.token.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheControllerKey.token.toString());
  }

  Future<bool> saveStudentId(String? studentId) async {
    final box = GetStorage();
    await box.write(CacheControllerKey.studentId.toString(), studentId);
    return true;
  }

  String? getStudentId(){
    final box = GetStorage();
    return box.read(CacheControllerKey.studentId.toString());
  }
}

enum CacheControllerKey { token, studentId }