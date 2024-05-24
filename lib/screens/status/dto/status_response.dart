import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'status_response.g.dart';

@JsonSerializable()
class StatusResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  List<Reservation>? data;

  StatusResponse({
    this.code,
    this.status,
    this.data,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) => _$StatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusResponseToJson(this);
}

@JsonSerializable()
class Reservation {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "booking_date")
  String? bookingDate;
  @JsonKey(name: "student_id")
  String? studentId;
  @JsonKey(name: "activity")
  String? activity;
  @JsonKey(name: "room")
  Room? room;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "status_text")
  String? statusText;

  Reservation({
    this.id,
    this.bookingDate,
    this.studentId,
    this.activity,
    this.room,
    this.status,
    this.statusText,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}

@JsonSerializable()
class Room {
  @JsonKey(name: "room")
  String? room;
  @JsonKey(name: "floor")
  String? floor;
  @JsonKey(name: "building")
  String? building;
  @JsonKey(name: "capacity")
  int? capacity;
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "end_time")
  String? endTime;

  Room({
    this.room,
    this.floor,
    this.building,
    this.capacity,
    this.startTime,
    this.endTime,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
