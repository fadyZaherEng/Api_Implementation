// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayslipContent _$PayslipContentFromJson(Map<String, dynamic> json) =>
    PayslipContent(
      salary: (json['salary'] as num).toDouble(),
      basicSalary: (json['basicSalary'] as num).toDouble(),
      hour: (json['hour'] as num).toDouble(),
      additions: (json['additions'] as num).toDouble(),
      decuted: (json['decuted'] as num).toDouble(),
    );

Map<String, dynamic> _$PayslipContentToJson(PayslipContent instance) =>
    <String, dynamic>{
      'salary': instance.salary,
      'basicSalary': instance.basicSalary,
      'hour': instance.hour,
      'additions': instance.additions,
      'decuted': instance.decuted,
    };
