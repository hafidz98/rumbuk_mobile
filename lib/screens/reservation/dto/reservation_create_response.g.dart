// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationCreateResponse _$ReservationCreateResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationCreateResponse(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ReservationCreateResponseToJson(
        ReservationCreateResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      reservation: json['reservation'] == null
          ? null
          : Reservation.fromJson(json['reservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'reservation': instance.reservation,
    };

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      id: (json['id'] as num?)?.toInt(),
      bookingDate: json['booking_date'] == null
          ? null
          : DateTime.parse(json['booking_date'] as String),
      studentId: json['student_id'] as String?,
      activity: json['activity'] as String?,
      room: json['room'] == null
          ? null
          : Room.fromJson(json['room'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusText: json['status_text'] as String?,
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_date': instance.bookingDate?.toIso8601String(),
      'student_id': instance.studentId,
      'activity': instance.activity,
      'room': instance.room,
      'status': instance.status,
      'status_text': instance.statusText,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      room: json['room'] as String?,
      floor: json['floor'] as String?,
      building: json['building'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'room': instance.room,
      'floor': instance.floor,
      'building': instance.building,
      'capacity': instance.capacity,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
