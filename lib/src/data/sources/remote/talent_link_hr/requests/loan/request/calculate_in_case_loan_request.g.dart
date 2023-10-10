// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_in_case_loan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateInCaseLoanRequest _$CalculateInCaseLoanRequestFromJson(
        Map<String, dynamic> json) =>
    CalculateInCaseLoanRequest(
      employeeId: json['employeeId'] as int? ?? 2220,
      toDate: json['toDate'] as String,
      totalAmount: json['totalAmount'] as int,
      isByInstallmentAmount: json['isByInstallmentAmount'] as int,
      installements: json['installements'] as int,
      loanStartDate: json['loanStartDate'] as String,
    );

Map<String, dynamic> _$CalculateInCaseLoanRequestToJson(
        CalculateInCaseLoanRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'toDate': instance.toDate,
      'totalAmount': instance.totalAmount,
      'isByInstallmentAmount': instance.isByInstallmentAmount,
      'installements': instance.installements,
      'loanStartDate': instance.loanStartDate,
    };
