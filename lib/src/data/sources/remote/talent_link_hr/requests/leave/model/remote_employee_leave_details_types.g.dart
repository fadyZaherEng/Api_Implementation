// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_employee_leave_details_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEmployeeLeaveDetailsTypes _$RemoteEmployeeLeaveDetailsTypesFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeLeaveDetailsTypes(
      id: json['id'] as int?,
      employeeLeaveDetailsId: json['employeeLeaveDetailsId'],
      leaveTypeId: json['leaveTypeId'] as int?,
      leaveTypeName: json['leaveTypeName'],
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      leaveDays: json['leaveDays'] as int?,
      leaveAmount: json['leaveAmount'] as int?,
      leaveDeductionAmount: json['leaveDeductionAmount'] as int?,
      weekendAmount: json['weekendAmount'] as int?,
      weekendDeductionAmount: json['weekendDeductionAmount'] as int?,
      publicHolidayAmount: json['publicHolidayAmount'] as int?,
      publicHolidayDeductionAmount:
          json['publicHolidayDeductionAmount'] as int?,
      basicSalaryAmount: json['basicSalaryAmount'] as int?,
      basicSalaryDeductionAmount: json['basicSalaryDeductionAmount'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      employeeLeaveDetailsTypesPaymentTypes:
          json['employeeLeaveDetailsTypesPaymentTypes'],
    );

Map<String, dynamic> _$RemoteEmployeeLeaveDetailsTypesToJson(
        RemoteEmployeeLeaveDetailsTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeLeaveDetailsId': instance.employeeLeaveDetailsId,
      'leaveTypeId': instance.leaveTypeId,
      'leaveTypeName': instance.leaveTypeName,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'leaveDays': instance.leaveDays,
      'leaveAmount': instance.leaveAmount,
      'leaveDeductionAmount': instance.leaveDeductionAmount,
      'weekendAmount': instance.weekendAmount,
      'weekendDeductionAmount': instance.weekendDeductionAmount,
      'publicHolidayAmount': instance.publicHolidayAmount,
      'publicHolidayDeductionAmount': instance.publicHolidayDeductionAmount,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'basicSalaryDeductionAmount': instance.basicSalaryDeductionAmount,
      'isDeleted': instance.isDeleted,
      'employeeLeaveDetailsTypesPaymentTypes':
          instance.employeeLeaveDetailsTypesPaymentTypes,
    };
