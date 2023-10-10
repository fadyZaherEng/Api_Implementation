import 'package:json_annotation/json_annotation.dart';

part 'remote_employee_leave_encashment_details_payment_types.g.dart';

@JsonSerializable()
class RemoteEmployeeLeaveEncashmentDetailsPaymentTypes {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'employeeLeaveEncashmentDetailsTypeId')
  final dynamic employeeLeaveEncashmentDetailsTypeId;
  @JsonKey(name: 'paymentTypeId')
  final int paymentTypeId;
  @JsonKey(name: 'paymentTypeName')
  final String paymentTypeName;
  @JsonKey(name: 'paymentTypeAmount')
  final int paymentTypeAmount;
  @JsonKey(name: 'paymentTypeDeductionAmount')
  final int paymentTypeDeductionAmount;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;

  RemoteEmployeeLeaveEncashmentDetailsPaymentTypes({
    required this.id,
    required this.employeeLeaveEncashmentDetailsTypeId,
    required this.paymentTypeId,
    required this.paymentTypeName,
    required this.paymentTypeAmount,
    required this.paymentTypeDeductionAmount,
    required this.isDeleted,
  });

  factory RemoteEmployeeLeaveEncashmentDetailsPaymentTypes.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteEmployeeLeaveEncashmentDetailsPaymentTypesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeLeaveEncashmentDetailsPaymentTypesToJson(this);
}
