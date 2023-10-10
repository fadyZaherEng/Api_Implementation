// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayslipRequest _$PayslipRequestFromJson(Map<String, dynamic> json) =>
    PayslipRequest(
      employeeId: json['employeeId'] as int? ?? 2220,
      month: json['month'] as int? ?? 7,
      year: json['year'] as int? ?? 2023,
    );

Map<String, dynamic> _$PayslipRequestToJson(PayslipRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'month': instance.month,
      'year': instance.year,
    };
