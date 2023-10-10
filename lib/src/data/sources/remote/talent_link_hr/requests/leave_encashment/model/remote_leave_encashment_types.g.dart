// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_leave_encashment_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLeaveEncashmentTypes _$RemoteLeaveEncashmentTypesFromJson(
        Map<String, dynamic> json) =>
    RemoteLeaveEncashmentTypes(
      name: json['leaveEncashmentTypeName'] as String? ?? '',
      id: json['leaveEncashmentTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteLeaveEncashmentTypesToJson(
        RemoteLeaveEncashmentTypes instance) =>
    <String, dynamic>{
      'leaveEncashmentTypeId': instance.id,
      'leaveEncashmentTypeName': instance.name,
    };
