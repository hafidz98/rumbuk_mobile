import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:get/get.dart';
//import 'package:get/get_rx/get_rx.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/exception/mapper.exception.dart';
import 'package:id_rumbuk_app/screens/reservation/dto/avail_room_response.dart'
    as avr;
import 'package:id_rumbuk_app/screens/reservation/dto/building_response.dart';
import 'package:id_rumbuk_app/screens/reservation/entity/building.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.service.dart';
import 'package:intl/intl.dart';

class ReservationController extends GetxController {
  late final AuthController _authController;
  late final ReservationService _reservationService;
  late final BuildingMapper _buildingMapper = BuildingMapper();

  late RxList<BuildingEntity> buildingList =
      List<BuildingEntity>.empty(growable: true).obs;
  late RxList<avr.Building> buildingRoomList =
      List<avr.Building>.empty(growable: true).obs;
  late RxList<avr.Floor> floorRoomList =
      List<avr.Floor>.empty(growable: true).obs;

  final EasyInfiniteDateTimelineController eIDTController =
      EasyInfiniteDateTimelineController();
  final DateTime appsFirstDate = DateTime.now();
  late DateTime focusDate = DateTime.now().add(const Duration(days: 4));
  final DateTime appsLastDate = DateTime.now().add(const Duration(days: 30));

  late DateTime selectedDate;

  RxInt selectedChipButton = 0.obs;
  RxInt selectedBuildingId = 0.obs;

  // @override
  // void onReady() async {
  //   await _getAvailRoomData();
  // }

  @override
  void onInit() async {
    super.onInit();
    _reservationService = Get.put(ReservationService());
    _authController = Get.find();
    selectedDate = focusDate;

    await _getBuildingData();
    await _getAvailRoomData();

    //getRoomOnBuildingID(selectedBuildingId.value);

    printInfo(info: selectedDate.toString());
    printInfo(info: selectedBuildingId.value.toString());
    printInfo(info: 'data lantai:${buildingRoomList[0].floors![0].name!}');

    //printInfo(info: 'data lantai2:${floorRoomList[0].name}');
  }

  Future<void> _getBuildingData() async {
    var buildings =
        await _reservationService.fetchBuilding(_authController.getToken());

    if (buildings.data!.isNotEmpty) {
      var data = _buildingMapper.toBuildingEntities(buildings.data!);
      buildingList.assignAll(data);
    }
  }

  Future<void> _getAvailRoomData() async {
    var date = DateFormat('yyyy-MM-dd');
    final List<avr.Building> buildings = [];

    try {
      var buildingData = await _reservationService.fetchRoom(
          _authController.getToken(), date.format(selectedDate));
      for (int i = 0; i < buildingData.data!.buildings!.length; i++) {
        buildings.add(buildingData.data!.buildings![i]);
      }

      buildingRoomList.addAll(buildings);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<void> getFloors() async {
  //   final List<avr.Floor> floors = [];
  //
  //   try {
  //     for (int i = 0; i < building.length; i++) {
  //       var dataFloor = building[i].floors;
  //       for (int j = 0; j < dataFloor!.length; j++) {
  //         floors.add(dataFloor as avr.Floor);
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // Future<void> getRoomOnBuildingID(int id) async {
  //   final List<avr.Floor> floors = [];
  //   try {
  //     for (int i = 0; i < buildingRoomList.length; i++) {
  //       if (buildingRoomList[i].id == id) {
  //         for (int j = 0; j < buildingRoomList[i].floors!.length; j++) {
  //           floors.add(buildingRoomList[i].floors![j]);
  //         }
  //         break;
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}

class BuildingMapper {
  BuildingEntity toBuildingEntity(Building building) {
    try {
      return BuildingEntity(name: building.name, id: building.id);
    } catch (e) {
      throw MapperException<Building, BuildingEntity>(e.toString());
    }
  }

  List<BuildingEntity> toBuildingEntities(List<Building> buildingList) {
    final List<BuildingEntity> buildingEntities = [];

    for (final building in buildingList) {
      try {
        buildingEntities.add(toBuildingEntity(building));
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return buildingEntities;
  }
}
