// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_employee_leave_encashment_details_payment_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEmployeeLeaveEncashmentDetailsPaymentTypes
    _$RemoteEmployeeLeaveEncashmentDetailsPaymentTypesFromJson(
            Map<String, dynamic> json) =>
        RemoteEmployeeLeaveEncashmentDetailsPaymentTypes(
          id: json['id'] as int,
          employeeLeaveEncashmentDetailsTypeId:
              json['employeeLeaveEncashmentDetailsTypeId'],
          paymentTypeId: json['paymentTypeId'] as int,
          paymentTypeName: json['paymentTypeName'] as String,
          paymentTypeAmount: json['paymentTypeAmount'] as int,
          paymentTypeDeductionAmount: json['paymentTypeDeductionAmount'] as int,
          isDeleted: json['isDeleted'] as bool,
        );

Map<String, dynamic> _$RemoteEmployeeLeaveEncashmentDetailsPaymentTypesToJson(
        RemoteEmployeeLeaveEncashmentDetailsPaymentTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeLeaveEncashmentDetailsTypeId':
          instance.employeeLeaveEncashmentDetailsTypeId,
      'paymentTypeId': instance.paymentTypeId,
      'paymentTypeName': instance.paymentTypeName,
      'paymentTypeAmount': instance.paymentTypeAmount,
      'paymentTypeDeductionAmount': instance.paymentTypeDeductionAmount,
      'isDeleted': instance.isDeleted,
    };
