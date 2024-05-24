import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:id_rumbuk_app/exception/network.exception.dart';
import 'package:id_rumbuk_app/model/dto/api.config.dart';
import 'package:id_rumbuk_app/screens/status/dto/status_response.dart';

class StatusService extends GetConnect {
  final String _apiEndpoint = ApiConfig.baseUrl;

  Future<StatusResponse> fetchStatusReservation(
      String? token, String? studentId) async {
    var requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    try {
      final response = await get(
          '$_apiEndpoint${ApiConfig.student}/$studentId${ApiConfig.reservation}',
          headers: requestHeader);

      if (response.statusCode != null && response.statusCode! >= 400) {
        return throw NetworkException(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
      return StatusResponse.fromJson(response.body);
    } catch (e) {
      return throw GetHttpException(e.toString());
    }
  }
}
