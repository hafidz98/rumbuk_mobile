import 'package:id_rumbuk_app/model/dto/generic.response.dart';

class LoginResponse implements Serializable {
  String? token;
  final String? name;
  final String? studentId;

  LoginResponse({this.token, this.name, this.studentId});

  factory LoginResponse.fromJson(Map<String, dynamic> json, String token) {
    return switch (json) {
      {
        'token': String token1,
      } =>
        LoginResponse(
          // name: name,
          // studentId: studentId,
          token: token1,
        ),
      _ => throw const FormatException('Failed to load Login data'),
    };
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

//
// 'name': String name,
// 'studentId': String studentId,
