// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentResponseImpl _$$StudentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentResponseImpl(
      studentId: json['student_id'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      batchYear: (json['batch_year'] as num?)?.toInt(),
      major: json['major'] as String?,
      faculty: json['faculty'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$StudentResponseImplToJson(
        _$StudentResponseImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'name': instance.name,
      'gender': instance.gender,
      'batch_year': instance.batchYear,
      'major': instance.major,
      'faculty': instance.faculty,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
    };
