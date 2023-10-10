// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDetailsDto _$RemoteDetailsDtoFromJson(Map<String, dynamic> json) =>
    RemoteDetailsDto(
      id: json['id'] as bool,
      employeeLeaveEncashmentId: json['employeeLeaveEncashmentId'],
      salaryMonth: json['salaryMonth'] as int,
      salaryYear: json['salaryYear'] as int,
      leaveDays: json['leaveDays'] as int,
      leaveAmount: json['leaveAmount'] as int,
      basicSalaryAmount: json['basicSalaryAmount'] as int,
      isSettled: json['isSettled'],
      settlementDate: json['settlementDate'],
      settlementRemarks: json['settlementRemarks'],
      referenceType: json['referenceType'],
      referenceId: json['referenceId'],
      remarks: json['remarks'],
      isDeleted: json['isDeleted'] as bool,
      employeeLeaveEncashmentDetailsPaymentTypes:
          (json['employeeLeaveEncashmentDetailsPaymentTypes'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteEmployeeLeaveEncashmentDetailsPaymentTypes.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RemoteDetailsDtoToJson(RemoteDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeLeaveEncashmentId': instance.employeeLeaveEncashmentId,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
      'leaveDays': instance.leaveDays,
      'leaveAmount': instance.leaveAmount,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'isSettled': instance.isSettled,
      'settlementDate': instance.settlementDate,
      'settlementRemarks': instance.settlementRemarks,
      'referenceType': instance.referenceType,
      'referenceId': instance.referenceId,
      'remarks': instance.remarks,
      'isDeleted': instance.isDeleted,
      'employeeLeaveEncashmentDetailsPaymentTypes':
          instance.employeeLeaveEncashmentDetailsPaymentTypes,
    };
