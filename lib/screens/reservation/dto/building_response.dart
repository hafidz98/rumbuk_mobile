import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'building_response.g.dart';

@JsonSerializable()
class BuildingResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  List<Building>? data;

  BuildingResponse({
    this.code,
    this.status,
    this.data,
  });

  factory BuildingResponse.fromJson(Map<String, dynamic> json) => _$BuildingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingResponseToJson(this);
}

@JsonSerializable()
class Building {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Building({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}
