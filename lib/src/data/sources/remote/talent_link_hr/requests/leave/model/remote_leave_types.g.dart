// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_leave_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLeaveTypes _$RemoteLeaveTypesFromJson(Map<String, dynamic> json) =>
    RemoteLeaveTypes(
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteLeaveTypesToJson(RemoteLeaveTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
