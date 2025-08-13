import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'reservation_create_response.g.dart';

@JsonSerializable()
class ReservationCreateResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "message")
  String? message;

  ReservationCreateResponse({
    this.code,
    this.status,
    this.data,
    this.message,
  });

  factory ReservationCreateResponse.fromJson(Map<String, dynamic> json) => _$ReservationCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationCreateResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "reservation")
  Reservation? reservation;

  Data({
    this.reservation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Reservation {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "booking_date")
  DateTime? bookingDate;
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