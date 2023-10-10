// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_short_leave_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteShortLeaveTypes _$RemoteShortLeaveTypesFromJson(
        Map<String, dynamic> json) =>
    RemoteShortLeaveTypes(
      name: json['shortLeaveTypeName'] as String? ?? '',
      id: json['shortLeaveTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteShortLeaveTypesToJson(
        RemoteShortLeaveTypes instance) =>
    <String, dynamic>{
      'shortLeaveTypeId': instance.id,
      'shortLeaveTypeName': instance.name,
    };
