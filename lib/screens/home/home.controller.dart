import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/model/entity/student.entity.dart';
import 'package:id_rumbuk_app/screens/home/home.service.dart';
import 'package:id_rumbuk_app/screens/profile/dto/student.response.dart';
import 'package:id_rumbuk_app/screens/profile/mapper/student.mapper.dart';

class HomeController extends GetxController {
  late final HomeService _homeService;
  late final AuthController _authController;
  late final StudentMapper _mapper = StudentMapper();

  Rx<int> hasReservation = 0.obs;
  late Rx<StudentEntity> studentData = StudentEntity().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _homeService = Get.put(HomeService());
    _authController = Get.find();

    await getStudent();
    await getReservation();
  }

  @override
  void refresh() {
    studentData.refresh();
  }

  Future<void> getStudent() async {
    var token = _authController.getToken();
    var studentId = _authController.getStudentIdFromBox();

    final response = await _homeService.fetchStudent(
        _authController.getToken(), _authController.getStudentIdFromBox());

    if (response != null) {
      studentData.value = _mapper.toStudent(response);
      studentData.refresh();
    } else {
      _authController.logOut();
      // Get.defaultDialog(
      //     middleText: 'User not found!',
      //     textConfirm: 'OK',
      //     onConfirm: () {
      //       refresh();
      //       Get.back();
      //     });
    }

    if (kDebugMode) {
      print(response);
      print(token);
      print(studentId);
      print(studentData.value.studentId);
    }
  }

  Future<void> getReservation() async {
    hasReservation.value = 1;
  }
}
