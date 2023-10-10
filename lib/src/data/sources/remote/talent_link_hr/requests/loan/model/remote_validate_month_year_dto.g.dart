// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_validate_month_year_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteValidateMonthYearDto _$RemoteValidateMonthYearDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteValidateMonthYearDto(
      isValid: json['isValid'] as bool,
      message: json['message'],
      salaryMonth: json['salaryMonth'],
      salaryYear: json['salaryYear'],
    );

Map<String, dynamic> _$RemoteValidateMonthYearDtoToJson(
        RemoteValidateMonthYearDto instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'message': instance.message,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
    };
