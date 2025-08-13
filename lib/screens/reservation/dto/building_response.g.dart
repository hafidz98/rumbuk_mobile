// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingResponse _$BuildingResponseFromJson(Map<String, dynamic> json) =>
    BuildingResponse(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Building.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildingResponseToJson(BuildingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
