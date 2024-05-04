import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:id_rumbuk_app/model/dto/generic.response.dart';
import 'package:id_rumbuk_app/screens/login/dto/login.request.dart';

import 'dto/login.response.dart';

class LoginService extends GetConnect{
  //final String apiEndpoint = 'https://reqres.in/api/login';
  final String apiEndpoint = 'http://192.168.1.10:8991/v1/rumbuk/auth';

  Future<String?> fetchLogin(LoginRequest loginReq) async{
    final response = await post(apiEndpoint, loginReq.toJson());
    final token = response.headers?['x-jwt-token-key'].toString();

    if (response.statusCode == HttpStatus.ok) {
      var data = GenericResponse.fromJson(response.body);
      return token;
    } else {
      return null;
    }
  }

}