import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/model/entity/student.entity.dart';
import 'package:id_rumbuk_app/screens/profile/mapper/student.mapper.dart';
import 'package:id_rumbuk_app/screens/profile/profile.service.dart';

class ProfileController extends GetxController{
  late final ProfileService _profileService;
  late final AuthController _authController;
  late final StudentMapper _mapper = StudentMapper();

  late Rx<StudentEntity> studentData = StudentEntity().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _profileService = Get.put(ProfileService());
    _authController = Get.find();

    await _getStudentData();
    _authController.changePINStatus();
  }

  Future<void> _getStudentData() async {
    try {
      final response = await _profileService.fetchStudent(_authController.getToken(), _authController.getStudentIdFromBox());
      studentData.value = _mapper.toStudent(response!);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

}