import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'reservation_create_request.g.dart';

@JsonSerializable()
class ReservationCreateRequest {
  @JsonKey(name: "booking_date")
  DateTime? bookingDate;
  @JsonKey(name: "student_id")
  String? studentId;
  @JsonKey(name: "activity")
  String? activity;
  @JsonKey(name: "room_timeslot_id")
  int? roomTimeslotId;

  ReservationCreateRequest({
    this.bookingDate,
    this.studentId,
    this.activity,
    this.roomTimeslotId,
  });

  factory ReservationCreateRequest.fromJson(Map<String, dynamic> json) => _$ReservationCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationCreateRequestToJson(this);
}
