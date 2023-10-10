// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_leave_encashment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseLeaveEncashment
    _$RemoteCalculateInCaseLeaveEncashmentFromJson(Map<String, dynamic> json) =>
        RemoteCalculateInCaseLeaveEncashment(
          mainStatus: json['mainStatus'] as bool?,
          mainMassage: json['mainMassage'] as String?,
          validateMonthYearDto: json['validateMonthYearDto'],
          employeeLeaveBalanceResponse: json['employeeLeaveBalanceResponce'] ==
                  null
              ? null
              : RemoteEmployeeLeaveBalanceResponse.fromJson(
                  json['employeeLeaveBalanceResponce'] as Map<String, dynamic>),
          detailsDto: json['detailsDto'] == null
              ? null
              : RemoteDetailsDto.fromJson(
                  json['detailsDto'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RemoteCalculateInCaseLeaveEncashmentToJson(
        RemoteCalculateInCaseLeaveEncashment instance) =>
    <String, dynamic>{
      'mainStatus': instance.mainStatus,
      'mainMassage': instance.mainMassage,
      'validateMonthYearDto': instance.validateMonthYearDto,
      'employeeLeaveBalanceResponce': instance.employeeLeaveBalanceResponse,
      'detailsDto': instance.detailsDto,
    };
