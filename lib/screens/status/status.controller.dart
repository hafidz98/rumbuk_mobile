import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/screens/status/dto/status_response.dart';
import 'package:id_rumbuk_app/screens/status/status.service.dart';

class StatusController extends GetxController {
  late final AuthController _authController;
  late final StatusService _statusService;

  final isLoading = false.obs;

  final TextEditingController statusControllerDropdown =
      TextEditingController();

  RxList<Reservation> reserveList = <Reservation>[].obs;
  RxList<Reservation> selectedReservation = <Reservation>[].obs;

  //RxList test = [{},{},{},{}].obs;

  Rx<StatusText?> selectedStatus = StatusText.allStatus.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _authController = Get.find();
    _statusService = Get.put(StatusService());

    await getStatusReservation();
    await getSelectedReservation(selectedStatus.value?.value ?? '9');
  }

  Future<void> getSelectedReservation(String status) async {
    List<Reservation> selectedReserve = [];
    await getStatusReservation();
    try {
      if (status == "9") {
        selectedReservation.clear();
        selectedReservation.addAll(reserveList);
        selectedReservation.sort((a, b) {
          var indexA = a.status;
          var indexB = b.status;
          if((indexA! == '0') && (indexB! == '0')){
            return 1;
          }
          return indexA.compareTo(indexB!);
        },);
      } else {
        selectedReserve = reserveList
            .where((reserveStatus) => reserveStatus.status == status)
            .toList();
        selectedReservation.clear();
        selectedReservation.addAll(selectedReserve);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getStatusReservation() async {
    //isLoading.value = true;
    final List<Reservation> reservations = [];

    try {
      final response = await _statusService.fetchStatusReservation(
          _authController.getToken(), _authController.getStudentIdFromBox());
      if (response.data is String){
        throw response.data.toString();
      }
      if (response.data != null && response.data is! String) {
        for (int i = 0; i < response.data!.length; i++) {
          reservations.add(response.data![i]);
        }
      }
      reserveList.clear();
      reserveList.addAll(reservations);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> refresh() async {
    await getStatusReservation();
    await getSelectedReservation(selectedStatus.value?.value ?? '9');
  }
}

enum StatusText {
  allStatus('Semua status', '9'),
  upcoming('Akan datang', '1'),
  ongoing('Berlangsung', '2'),
  cancel('Batal', '0'),
  done('Selesai', '3');

  const StatusText(this.statusText, this.value);
  final String statusText;
  final String value;
}
