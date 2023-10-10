// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertLeaveRequest _$InsertLeaveRequestFromJson(Map<String, dynamic> json) =>
    InsertLeaveRequest(
      employeeId: json['employeeId'] as int,
      leaveTypeId: json['leaveTypeId'] as int,
      leaveStartDate: json['leaveStartDate'] as String,
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      leaveEndDate: json['leaveEndDate'] as String,
      expectedResumeDuty: json['expectedResumeDuty'] as String,
      isByPayroll: json['isByPayroll'] as int,
      paymentMethodId: json['paymentMethodId'] as int,
      remarks: json['remarks'] as String,
      leaveReason: json['leaveReason'] as String,
      alternativeEmployeeId: json['alternativeEmployeeId'] as String,
      emergencyContactNo: json['emergencyContactNo'] as String,
      addressDuringLeave: json['addressDuringLeave'] as String,
      isExtendedLeave: json['isExtendedLeave'] as int,
      extendedEmployeeLeaveId: json['extendedEmployeeLeaveId'] as int,
      totalAmount: json['totalAmount'] as int,
      isByCurrentBalance: json['isByCurrentBalance'] as int,
      currentBalance: json['currentBalance'] as int,
      yearlyBalance: json['yearlyBalance'] as int,
      remainingBalance: json['remainingBalance'] as int,
      basicSalaryAmount: json['basicSalaryAmount'] as int,
      allowancesAmount: json['allowancesAmount'] as int,
      leaveDays: json['leaveDays'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      transactionStatusName: json['transactionStatusName'] as String,
      wfId: json['wfId'] as int,
      isAllowYearlyBalance: json['isAllowYearlyBalance'] as int,
    );

Map<String, dynamic> _$InsertLeaveRequestToJson(InsertLeaveRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'leaveTypeId': instance.leaveTypeId,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'expectedResumeDuty': instance.expectedResumeDuty,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'remarks': instance.remarks,
      'leaveReason': instance.leaveReason,
      'alternativeEmployeeId': instance.alternativeEmployeeId,
      'emergencyContactNo': instance.emergencyContactNo,
      'addressDuringLeave': instance.addressDuringLeave,
      'isExtendedLeave': instance.isExtendedLeave,
      'extendedEmployeeLeaveId': instance.extendedEmployeeLeaveId,
      'totalAmount': instance.totalAmount,
      'isByCurrentBalance': instance.isByCurrentBalance,
      'currentBalance': instance.currentBalance,
      'yearlyBalance': instance.yearlyBalance,
      'remainingBalance': instance.remainingBalance,
      'basicSalaryAmount': instance.basicSalaryAmount,
      'allowancesAmount': instance.allowancesAmount,
      'leaveDays': instance.leaveDays,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'wfId': instance.wfId,
      'isAllowYearlyBalance': instance.isAllowYearlyBalance,
    };
