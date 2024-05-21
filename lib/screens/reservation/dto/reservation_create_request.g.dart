// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationCreateRequest _$ReservationCreateRequestFromJson(
        Map<String, dynamic> json) =>
    ReservationCreateRequest(
      bookingDate: json['booking_date'] == null
          ? null
          : DateTime.parse(json['booking_date'] as String),
      studentId: json['student_id'] as String?,
      activity: json['activity'] as String?,
      roomTimeslotId: (json['room_timeslot_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReservationCreateRequestToJson(
        ReservationCreateRequest instance) =>
    <String, dynamic>{
      'booking_date': instance.bookingDate?.toIso8601String(),
      'student_id': instance.studentId,
      'activity': instance.activity,
      'room_timeslot_id': instance.roomTimeslotId,
    };
