// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_leave_encashment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseLeaveEncashmentRequest
    _$CalculateInCaseLeaveEncashmentRequestFromJson(
            Map<String, dynamic> json) =>
        CalculateInCaseLeaveEncashmentRequest(
          employeeId: json['employeeId'] as int? ?? 2220,
          fromDate: json['fromDate'] as String? ?? '',
          leaveTypeId: json['leaveTypeId'] as int? ?? 0,
          requestedDate: json['requestedDate'] as String? ?? '',
          requestedDays: json['requestedDays'] as int? ?? 0,
        );

Map<String, dynamic> _$CalculateInCaseLeaveEncashmentRequestToJson(
        CalculateInCaseLeaveEncashmentRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'fromDate': instance.fromDate,
      'leaveTypeId': instance.leaveTypeId,
      'requestedDate': instance.requestedDate,
      'requestedDays': instance.requestedDays,
    };
