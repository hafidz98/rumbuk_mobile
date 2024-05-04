import 'dart:convert';

class GenericResponse {
  int? code;
  String? status;
  dynamic data;

  GenericResponse({
    this.code,
    this.status,
    this.data,
  });

  factory GenericResponse.fromRawJson(String str) => GenericResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenericResponse.fromJson(Map<String, dynamic> json) => GenericResponse(
    code: json["code"],
    status: json["status"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data,
  };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
