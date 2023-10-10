// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_loan_policy_outputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLoanPolicyOutputs _$RemoteLoanPolicyOutputsFromJson(
        Map<String, dynamic> json) =>
    RemoteLoanPolicyOutputs(
      status: json['status'] as bool,
      message: json['message'],
      indemnityServiceDays: json['indemnityServiceDays'] as int,
      indemnityDays: json['indemnityDays'] as int,
      indemnityAmount: (json['indemnityAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$RemoteLoanPolicyOutputsToJson(
        RemoteLoanPolicyOutputs instance) =>
    <String, dynamic>{
      'status': instance.status,
      'indemnityServiceDays': instance.indemnityServiceDays,
      'indemnityDays': instance.indemnityDays,
      'indemnityAmount': instance.indemnityAmount,
      'message': instance.message,
    };
