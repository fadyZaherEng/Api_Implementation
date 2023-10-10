// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_half_day_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteHalfDayTypes _$RemoteHalfDayTypesFromJson(Map<String, dynamic> json) =>
    RemoteHalfDayTypes(
      name: json['halfDayLeaveTypeName'] as String? ?? '',
      id: json['halfDayLeaveTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteHalfDayTypesToJson(RemoteHalfDayTypes instance) =>
    <String, dynamic>{
      'halfDayLeaveTypeId': instance.id,
      'halfDayLeaveTypeName': instance.name,
    };
