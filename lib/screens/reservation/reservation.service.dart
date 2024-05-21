import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:id_rumbuk_app/exception/network.exception.dart';
import 'package:id_rumbuk_app/model/dto/api.config.dart';
import 'package:id_rumbuk_app/screens/reservation/dto/avail_room_response.dart';
import 'package:id_rumbuk_app/screens/reservation/dto/building_response.dart';

class ReservationService extends GetConnect {
  final String apiEndpoint = ApiConfig.baseUrl;

  Future<BuildingResponse> fetchBuilding(String? token) async {
    Map<String, String> requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    try {
      final response = await get('$apiEndpoint${ApiConfig.building}',
          headers: requestHeader);

      if (response.statusCode != null && response.statusCode! >= 400) {
        return throw NetworkException(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
      return BuildingResponse.fromJson(response.body);
    } catch (e) {
      return throw GetHttpException(e.toString());
    }
  }

  Future<AvailableRoomResponse> fetchRoom(String? token, String date) async {
    final requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    final queryParam = {
      'date' : date,
    };

    try {
      final response = await get('$apiEndpoint${ApiConfig.availableRoom}', headers: requestHeader, query: queryParam);

      //printInfo(info: '');

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkException(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
      return AvailableRoomResponse.fromJson(response.body);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> createReservation(String? token, body) async {
    Map<String, String> requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    try {
      final response = await post(apiEndpoint, body, headers: requestHeader);

      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkException(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      } else if (response.statusCode != null) {}
    } catch (e) {
      throw FormatException(e.toString());
    }
  }
}

// get building data based on date
// get room data based on building data
// save reservation data to db using api service
