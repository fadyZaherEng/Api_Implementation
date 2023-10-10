// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_new_leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseNewLeave _$RemoteCalculateInCaseNewLeaveFromJson(
        Map<String, dynamic> json) =>
    RemoteCalculateInCaseNewLeave(
      mainStatus: json['mainStatus'] as bool?,
      mainMassage: json['mainMassage'] as String?,
      validateMonthYear: json['validateMonthYear'] == null
          ? null
          : RemoteValidateMonthYear.fromJson(
              json['validateMonthYear'] as Map<String, dynamic>),
      employeeLeaveBalanceResponse: json['employeeLeaveBalanceResponce'] == null
          ? null
          : RemoteEmployeeLeaveBalanceResponse.fromJson(
              json['employeeLeaveBalanceResponce'] as Map<String, dynamic>),
      employeeLeaveDetailsDto: json['employeeLeaveDetailsDto'] == null
          ? null
          : RemoteEmployeeLeaveDetailsDto.fromJson(
              json['employeeLeaveDetailsDto'] as Map<String, dynamic>),
      employeeLeaveDeductionDtos:
          json['employeeLeaveDeductionDtos'] as List<dynamic>?,
      employeeLeaveAdditionDtos:
          json['employeeLeaveAdditionDtos'] as List<dynamic>?,
    );

Map<String, dynamic> _$RemoteCalculateInCaseNewLeaveToJson(
        RemoteCalculateInCaseNewLeave instance) =>
    <String, dynamic>{
      'mainStatus': instance.mainStatus,
      'mainMassage': instance.mainMassage,
      'validateMonthYear': instance.validateMonthYear,
      'employeeLeaveBalanceResponce': instance.employeeLeaveBalanceResponse,
      'employeeLeaveDetailsDto': instance.employeeLeaveDetailsDto,
      'employeeLeaveDeductionDtos': instance.employeeLeaveDeductionDtos,
      'employeeLeaveAdditionDtos': instance.employeeLeaveAdditionDtos,
    };
