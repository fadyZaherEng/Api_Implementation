// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_leave_encashment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertLeaveEncashmentRequest _$InsertLeaveEncashmentRequestFromJson(
        Map<String, dynamic> json) =>
    InsertLeaveEncashmentRequest(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      isByPayroll: json['isByPayroll'] as int,
      paymentMethodId: json['paymentMethodId'] as int,
      remarks: json['remarks'] as String,
      totalAmount: json['TotalAmount'] as int,
      isByCurrentBalance: json['IsByCurrentBalance'] as int,
      currentBalance: json['currentBalance'] as int,
      yearlyBalance: json['YearlyBalance'] as int,
      remainingBalance: json['remainingBalance'] as int,
      basicSalaryAmount: json['BasicSalaryAmount'] as int,
      allowancesAmount: json['AllowancesAmount'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      wfId: json['wfId'] as int,
      isAllowYearlyBalance: json['isAllowYearlyBalance'] as int,
      requestedDate: json['RequestedDate'] as String,
      requestedDays: json['RequestedDays'] as int,
      employeeId: json['employeeId'] as int,
      encashmentLeaveTypeId: json['EncashmentLeaveTypeId'] as int,
      leaveEncashmentId: json['LeaveEncashmentId'] as int,
    );

Map<String, dynamic> _$InsertLeaveEncashmentRequestToJson(
        InsertLeaveEncashmentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'LeaveEncashmentId': instance.leaveEncashmentId,
      'EncashmentLeaveTypeId': instance.encashmentLeaveTypeId,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'RequestedDate': instance.requestedDate,
      'RequestedDays': instance.requestedDays,
      'TotalAmount': instance.totalAmount,
      'IsByCurrentBalance': instance.isByCurrentBalance,
      'currentBalance': instance.currentBalance,
      'YearlyBalance': instance.yearlyBalance,
      'remainingBalance': instance.remainingBalance,
      'BasicSalaryAmount': instance.basicSalaryAmount,
      'AllowancesAmount': instance.allowancesAmount,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'wfId': instance.wfId,
      'isAllowYearlyBalance': instance.isAllowYearlyBalance,
    };
