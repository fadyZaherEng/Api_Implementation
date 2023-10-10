// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_employee_policy_profile_leave_encashment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetEmployeePolicyProfileLeaveEncashmentDetails
    _$RemoteGetEmployeePolicyProfileLeaveEncashmentDetailsFromJson(
            Map<String, dynamic> json) =>
        RemoteGetEmployeePolicyProfileLeaveEncashmentDetails(
          leaveTypeId: json['leaveTypeId'] as int,
          encashmentleaveTypeId: json['encashmentleaveTypeId'] as int,
          leaveTypeName: json['leaveTypeName'] as String,
          maximumDays: json['maximumDays'] as int,
        );

Map<String, dynamic>
    _$RemoteGetEmployeePolicyProfileLeaveEncashmentDetailsToJson(
            RemoteGetEmployeePolicyProfileLeaveEncashmentDetails instance) =>
        <String, dynamic>{
          'leaveTypeId': instance.leaveTypeId,
          'encashmentleaveTypeId': instance.encashmentleaveTypeId,
          'leaveTypeName': instance.leaveTypeName,
          'maximumDays': instance.maximumDays,
        };
