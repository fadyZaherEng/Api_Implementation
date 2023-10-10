// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_new_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseNewLeaveRequest _$CalculateInCaseNewLeaveRequestFromJson(
        Map<String, dynamic> json) =>
    CalculateInCaseNewLeaveRequest(
      employeeId: json['EmployeeId'] as int?,
      leaveTypeId: json['LeaveTypeId'] as int?,
      fromDate: json['FromDate'] as String?,
      toDate: json['ToDate'] as String?,
      isByPayroll: json['IsByPayroll'] as int?,
    );

Map<String, dynamic> _$CalculateInCaseNewLeaveRequestToJson(
        CalculateInCaseNewLeaveRequest instance) =>
    <String, dynamic>{
      'EmployeeId': instance.employeeId,
      'FromDate': instance.fromDate,
      'ToDate': instance.toDate,
      'LeaveTypeId': instance.leaveTypeId,
      'IsByPayroll': instance.isByPayroll,
    };
