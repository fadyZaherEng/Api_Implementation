// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_loan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertLoanRequest _$InsertLoanRequestFromJson(Map<String, dynamic> json) =>
    InsertLoanRequest(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      employeeId: json['employeeId'] as int,
      loanTypeId: json['loanTypeId'] as int,
      loanRequestedDate: json['loanRequestedDate'] as String,
      loanRequestedAmount: json['loanRequestedAmount'] as int,
      profitRate: json['profitRate'] as int,
      loanTotalAmount: json['loanTotalAmount'] as int,
      paymentStartMonth: json['paymentStartMonth'] as int,
      paymentStartYear: json['paymentStartYear'] as int,
      isByInstallmentAmount: json['isByInstallmentAmount'] as int,
      installments: json['installments'] as int,
      isByPayroll: json['isByPayroll'] as int,
      paymentMethodId: json['paymentMethodId'] as int,
      salaryDeductionPercentage: json['salaryDeductionPercentage'] as int,
      isClosed: json['isClosed'] as int,
      remarks: json['remarks'] as String,
      indemnityServiceDays: json['indemnityServiceDays'] as int,
      indemnityDays: json['indemnityDays'] as int,
      indemnityAmount: json['indemnityAmount'] as int,
      basicSalaryAmount: json['basicSalaryAmount'] as int,
      allowancesAmount: json['allowancesAmount'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      workFlowId: json['workFlowId'] as int,
      noOfDigits: json['noOfDigits'] as int,
      currencyCode: json['currencyCode'] as String,
    );

Map<String, dynamic> _$InsertLoanRequestToJson(InsertLoanRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'loanTypeId': instance.loanTypeId,
      'loanRequestedDate': instance.loanRequestedDate,
      'loanRequestedAmount': instance.loanRequestedAmount,
      'profitRate': instance.profitRate,
      'loanTotalAmount': instance.loanTotalAmount,
      'paymentStartMonth': instance.paymentStartMonth,
      'paymentStartYear': instance.paymentStartYear,
      'isByInstallmentAmount': instance.isByInstallmentAmount,
      'installments': instance.installments,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'salaryDeductionPercentage': instance.salaryDeductionPercentage,
      'isClosed': instance.isClosed,
      'remarks': instance.remarks,
      'indemnityServiceDays': instance.indemnityServiceDays,
      'indemnityDays': instance.indemnityDays,
      'indemnityAmount': instance.indemnityAmount,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'transactionStatusId': instance.transactionStatusId,
      'workFlowId': instance.workFlowId,
      'noOfDigits': instance.noOfDigits,
      'currencyCode': instance.currencyCode,
    };
