// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avail_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableRoomResponse _$AvailableRoomResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableRoomResponse(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvailableRoomResponseToJson(
        AvailableRoomResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      buildings: (json['buildings'] as List<dynamic>?)
          ?.map((e) => Building.fromJson(e as Map<String, dynamic>))
          .toList(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'buildings': instance.buildings,
      'date': instance.date?.toIso8601String(),
    };

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      floors: (json['floors'] as List<dynamic>?)
          ?.map((e) => Floor.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'floors': instance.floors,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rooms': instance.rooms,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      timeSlot: (json['time_slot'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capacity': instance.capacity,
      'time_slot': instance.timeSlot,
    };

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => TimeSlot(
      rtsId: (json['rts_id'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      reserved: json['reserved'] as bool?,
    );

Map<String, dynamic> _$TimeSlotToJson(TimeSlot instance) => <String, dynamic>{
      'rts_id': instance.rtsId,
      'id': instance.id,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration': instance.duration,
      'reserved': instance.reserved,
    };
