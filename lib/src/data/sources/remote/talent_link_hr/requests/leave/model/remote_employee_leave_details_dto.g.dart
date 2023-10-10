// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_employee_leave_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEmployeeLeaveDetailsDto _$RemoteEmployeeLeaveDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteEmployeeLeaveDetailsDto(
      id: json['id'] as int?,
      employeeLeaveId: json['employeeLeaveId'],
      salaryMonth: json['salaryMonth'] as int?,
      salaryYear: json['salaryYear'] as int?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      calendarDays: json['calendarDays'] as int?,
      workingDays: json['workingDays'] as int?,
      leaveDays: json['leaveDays'],
      weekendDays: json['weekendDays'] as int?,
      publicHolidays: json['publicHolidays'] as int?,
      workingDaysAmount: json['workingDaysAmount'] as int?,
      workingDaysDeductionAmount: json['workingDaysDeductionAmount'] as int?,
      leaveAmount: json['leaveAmount'],
      leaveDeductionAmount: json['leaveDeductionAmount'] as int?,
      weekendAmount: json['weekendAmount'] as int?,
      weekendDeductionAmount: json['weekendDeductionAmount'] as int?,
      publicHolidayAmount: json['publicHolidayAmount'] as int?,
      publicHolidayDeductionAmount: json['publicHolidayDeductionAmount'],
      isSettled: json['isSettled'],
      settlementDate: json['settlementDate'],
      settlementRemarks: json['settlementRemarks'],
      referenceType: json['referenceType'],
      referenceId: json['referenceId'],
      remarks: json['remarks'],
      isDeleted: json['isDeleted'] as bool?,
      employeeLeaveDetailsTypes: json['employeeLeaveDetailsTypes'] == null
          ? null
          : RemoteEmployeeLeaveDetailsTypes.fromJson(
              json['employeeLeaveDetailsTypes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteEmployeeLeaveDetailsDtoToJson(
        RemoteEmployeeLeaveDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeLeaveId': instance.employeeLeaveId,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'calendarDays': instance.calendarDays,
      'workingDays': instance.workingDays,
      'leaveDays': instance.leaveDays,
      'weekendDays': instance.weekendDays,
      'publicHolidays': instance.publicHolidays,
      'workingDaysAmount': instance.workingDaysAmount,
      'workingDaysDeductionAmount': instance.workingDaysDeductionAmount,
      'leaveAmount': instance.leaveAmount,
      'leaveDeductionAmount': instance.leaveDeductionAmount,
      'weekendAmount': instance.weekendAmount,
      'weekendDeductionAmount': instance.weekendDeductionAmount,
      'publicHolidayAmount': instance.publicHolidayAmount,
      'publicHolidayDeductionAmount': instance.publicHolidayDeductionAmount,
      'isSettled': instance.isSettled,
      'settlementDate': instance.settlementDate,
      'settlementRemarks': instance.settlementRemarks,
      'referenceType': instance.referenceType,
      'referenceId': instance.referenceId,
      'remarks': instance.remarks,
      'isDeleted': instance.isDeleted,
      'employeeLeaveDetailsTypes': instance.employeeLeaveDetailsTypes,
    };
