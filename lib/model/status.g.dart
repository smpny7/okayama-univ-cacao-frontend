// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      success: json['success'] as bool,
      data: StatusData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$_StatusData _$$_StatusDataFromJson(Map<String, dynamic> json) =>
    _$_StatusData(
      activeRoom: json['active_room'] as String?,
      isMyRoom: json['is_my_room'] as bool,
    );

Map<String, dynamic> _$$_StatusDataToJson(_$_StatusData instance) =>
    <String, dynamic>{
      'active_room': instance.activeRoom,
      'is_my_room': instance.isMyRoom,
    };
