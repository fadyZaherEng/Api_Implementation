// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_short_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseShortLeaveRequest _$CalculateInCaseShortLeaveRequestFromJson(
        Map<String, dynamic> json) =>
    CalculateInCaseShortLeaveRequest(
      employeeId: json['EmployeeId'] as int?,
      shortLeaveTypeId: json['ShortLeaveTypeId'] as int?,
      shortLeaveDate: json['ShortLeaveDate'] as String?,
      startTime: json['StartTime'] as String?,
      endTime: json['EndTime'] as String?,
    );

Map<String, dynamic> _$CalculateInCaseShortLeaveRequestToJson(
        CalculateInCaseShortLeaveRequest instance) =>
    <String, dynamic>{
      'EmployeeId': instance.employeeId,
      'ShortLeaveTypeId': instance.shortLeaveTypeId,
      'ShortLeaveDate': instance.shortLeaveDate,
      'StartTime': instance.startTime,
      'EndTime': instance.endTime,
    };
