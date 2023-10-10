// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_validate_month_year.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteValidateMonthYear _$RemoteValidateMonthYearFromJson(
        Map<String, dynamic> json) =>
    RemoteValidateMonthYear(
      isValid: json['isValid'] as bool?,
      message: json['message'],
      salaryYear: json['salaryYear'],
      salaryMonth: json['salaryMonth'],
    );

Map<String, dynamic> _$RemoteValidateMonthYearToJson(
        RemoteValidateMonthYear instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'message': instance.message,
      'salaryMonth': instance.salaryMonth,
      'salaryYear': instance.salaryYear,
    };
