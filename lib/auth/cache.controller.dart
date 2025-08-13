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

  Future<bool> savePIN(String? pinValue) async{
    final box = GetStorage();
    await box.write(CacheControllerKey.pin.toString(), pinValue);
    return true;
  }

  Future<void> removePIN() async {
    final box = GetStorage();
    await box.remove(CacheControllerKey.pin.toString());
  }

  String? getPIN(){
    final box = GetStorage();
    return box.read(CacheControllerKey.pin.toString());
  }

  Future<bool> saveFingerprint() async{
    final box = GetStorage();
    await box.write(CacheControllerKey.fingerprint.toString(), '1');
    return true;
  }

  Future<void> removeFingerprint() async {
    final box = GetStorage();
    await box.remove(CacheControllerKey.fingerprint.toString());
  }

  String? getFingerprint(){
    final box = GetStorage();
    return box.read(CacheControllerKey.fingerprint.toString());
  }

}

enum CacheControllerKey { token, studentId, pin, fingerprint}