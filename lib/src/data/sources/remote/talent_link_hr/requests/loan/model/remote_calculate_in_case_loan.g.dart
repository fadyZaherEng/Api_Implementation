// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseLoan _$RemoteCalculateInCaseLoanFromJson(
        Map<String, dynamic> json) =>
    RemoteCalculateInCaseLoan(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      loanPolicyOutputs: json['loanPolicyOutputs'] == null
          ? null
          : RemoteLoanPolicyOutputs.fromJson(
              json['loanPolicyOutputs'] as Map<String, dynamic>),
      validateMonthYearDto: json['validateMonthYearDto'] == null
          ? null
          : RemoteValidateMonthYearDto.fromJson(
              json['validateMonthYearDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteCalculateInCaseLoanToJson(
        RemoteCalculateInCaseLoan instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'loanPolicyOutputs': instance.loanPolicyOutputs,
      'validateMonthYearDto': instance.validateMonthYearDto,
    };
