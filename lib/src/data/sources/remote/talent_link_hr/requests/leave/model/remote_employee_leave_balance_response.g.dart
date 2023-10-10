// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_employee_leave_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEmployeeLeaveBalanceResponse _$RemoteEmployeeLeaveBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeLeaveBalanceResponse(
      isAllowYearlyBalance: json['isAllowYearlyBalance'] as bool?,
      currentBalance: json['currentBalance'],
      yearlyBalance: json['yearlyBalance'],
      leaveDays: json['leaveDays'],
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RemoteEmployeeLeaveBalanceResponseToJson(
        RemoteEmployeeLeaveBalanceResponse instance) =>
    <String, dynamic>{
      'isAllowYearlyBalance': instance.isAllowYearlyBalance,
      'currentBalance': instance.currentBalance,
      'yearlyBalance': instance.yearlyBalance,
      'leaveDays': instance.leaveDays,
      'status': instance.status,
      'message': instance.message,
    };
