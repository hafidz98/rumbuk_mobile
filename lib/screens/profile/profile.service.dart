import 'package:get/get_connect.dart';
import 'package:id_rumbuk_app/exception/network.exception.dart';
import 'package:id_rumbuk_app/model/dto/api.config.dart';
import 'package:id_rumbuk_app/model/dto/generic.response.dart';
import 'package:id_rumbuk_app/screens/profile/dto/student.response.dart';

class ProfileService extends GetConnect {
  final String apiEndpoint = ApiConfig.baseUrl + ApiConfig.student;

  Future<StudentResponse?> fetchStudent(
      String? token, String? studentId) async {
    Map<String, String> requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    try {
      final response =
          await get('$apiEndpoint/$studentId', headers: requestHeader);
      var responseData = GenericResponse.fromJson(response.body);
      if (response.statusCode != null && response.statusCode! >= 400) {
        throw NetworkException(
          statusCode: response.statusCode!,
          message: response.statusText!,
        );
      }
      return StudentResponse.fromJson(responseData.data);
    } catch (e) {
      return throw FormatException(e.toString());
    }
  }
}
