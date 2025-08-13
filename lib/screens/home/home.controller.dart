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
  Future<void> refresh() async{
    await getStudent();
    await getReservation();
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
    }
    studentData.refresh();

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

  var newsData = [
    {
      'url':
      'https://teknokrat.ac.id/universitas-teknokrat-indonesia-jadi-tuan-rumah-umkm-msib-inisiasi-apindo-lampung/',
      'title':
      'Universitas Teknokrat Indonesia Jadi Tuan Rumah UMKM MSIB Inisiasi Apindo Lampung',
      'date':'2024-05-27',
      'image':
      'https://teknokrat.ac.id/wp-content/uploads/2024/05/WhatsApp-Image-2024-05-27-at-07.46.57.jpeg'
    },
    {
      'url':
      'https://teknokrat.ac.id/kampus-entrepreneur-lampung-anggota-dprd-lampung-rahmat-mirzani-djausal-apresiasi-teknokrat-entrepreneur-vaganza-2024-inkubator-bisnis-terus-ditumbuhkan/',
      'title':
      'Kampus Entrepreneur Lampung : Anggota DPRD Lampung Rahmat Mirzani Djausal Apresiasi Teknokrat Entrepreneur Vaganza 2024, Inkubator Bisnis Terus Ditumbuhkan',
      'date':'2024-05-20',
      'image':
      'https://teknokrat.ac.id/wp-content/uploads/2024/05/Kampus-Entrepreneur-Lampung.jpg'
    },
    {
      'url':
      'https://teknokrat.ac.id/universitas-teknokrat-gelar-pentas-islami-ke-17-perkaya-wawasan-keislaman-generasi-muda/',
      'title':
      'Universitas Teknokrat Gelar Pentas Islami ke-17, Perkaya Wawasan Keislaman Generasi Muda',
      'date':'2024-05-20',
      'image':
      'https://teknokrat.ac.id/wp-content/uploads/2024/05/IMG_20240519_094948.jpg'
    },
    {
      'url':
      'https://teknokrat.ac.id/mahasiswa-sastra-inggris-teknokrat-juara-di-alsa-national-english-competitions/',
      'title':
      'Mahasiswa Sastra Inggris Teknokrat Juara di ALSA National English Competitions',
      'date':'2024-05-14',
      'image':
      'https://teknokrat.ac.id/wp-content/uploads/2024/05/IMG_20240508_170117.jpg'
    }
  ];
}
