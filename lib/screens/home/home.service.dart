import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:id_rumbuk_app/model/dto/api.config.dart';
import 'package:id_rumbuk_app/model/dto/generic.response.dart';
import 'package:id_rumbuk_app/screens/profile/dto/student.response.dart';

class HomeService extends GetConnect {
  final String apiEndpoint = ApiConfig.baseUrl + ApiConfig.student;

  Future<StudentResponse?> fetchStudent(String? token, studentId) async {
    Map<String, String> requestHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-JWT-TOKEN-KEY': '$token'
    };

    final response = await get('$apiEndpoint/$studentId', headers: requestHeader);

    if (response.statusCode == HttpStatus.ok) {
      var data = GenericResponse.fromJson(response.body);
      return StudentResponse.fromJson(data.data);
    } else {
      if (kDebugMode) {
        print('$apiEndpoint/$studentId');
        print(token);
        print(response.body);
      }
      return null;
    }
  }
}
