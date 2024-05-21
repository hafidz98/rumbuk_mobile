import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'student.response.g.dart';

@JsonSerializable()
class StudentResponse {
  @JsonKey(name: "student_id")
  String? studentId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "batch_year")
  int? batchYear;
  @JsonKey(name: "major")
  String? major;
  @JsonKey(name: "faculty")
  String? faculty;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "email")
  String? email;

  StudentResponse({
    this.studentId,
    this.name,
    this.gender,
    this.batchYear,
    this.major,
    this.faculty,
    this.phoneNumber,
    this.email,
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) => _$StudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentResponseToJson(this);
}
