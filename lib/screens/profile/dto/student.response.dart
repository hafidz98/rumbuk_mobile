import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.response.freezed.dart';
part 'student.response.g.dart';

@freezed
@JsonSerializable()
class StudentResponse with _$StudentResponse {
  const factory StudentResponse({
    @JsonKey(name: "student_id")
    String? studentId,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "gender")
    String? gender,
    @JsonKey(name: "batch_year")
    int? batchYear,
    @JsonKey(name: "major")
    String? major,
    @JsonKey(name: "faculty")
    String? faculty,
    @JsonKey(name: "phone_number")
    String? phoneNumber,
    @JsonKey(name: "email")
    String? email,
  }) = _StudentResponse;

  factory StudentResponse.fromJson(Map<String, dynamic> json) => _$StudentResponseFromJson(json);
}
