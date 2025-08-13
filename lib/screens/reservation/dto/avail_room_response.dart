import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'avail_room_response.g.dart';

@JsonSerializable()
class AvailableRoomResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  Data? data;

  AvailableRoomResponse({
    this.code,
    this.status,
    this.data,
  });

  factory AvailableRoomResponse.fromJson(Map<String, dynamic> json) => _$AvailableRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableRoomResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "buildings")
  List<Building>? buildings;
  @JsonKey(name: "date")
  DateTime? date;

  Data({
    this.buildings,
    this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Building {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "floors")
  List<Floor>? floors;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Building({
    this.id,
    this.name,
    this.floors,
    this.createdAt,
    this.updatedAt,
  });

  factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}

@JsonSerializable()
class Floor {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "rooms")
  List<Room>? rooms;

  Floor({
    this.id,
    this.name,
    this.rooms,
  });

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}

@JsonSerializable()
class Room {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "capacity")
  int? capacity;
  @JsonKey(name: "time_slot")
  List<TimeSlot>? timeSlot;

  Room({
    this.id,
    this.name,
    this.capacity,
    this.timeSlot,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class TimeSlot {
  @JsonKey(name: "rts_id")
  int? rtsId;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "end_time")
  String? endTime;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "reserved")
  bool? reserved;

  TimeSlot({
    this.rtsId,
    this.id,
    this.startTime,
    this.endTime,
    this.duration,
    this.reserved,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotToJson(this);
}
