import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_employee_leave_encashment_details_payment_types.dart';

part 'remote_details_dto.g.dart';

@JsonSerializable()
class RemoteDetailsDto {
  @JsonKey(name: 'id')
  final bool id;
  @JsonKey(name: 'employeeLeaveEncashmentId')
  final dynamic employeeLeaveEncashmentId;
  @JsonKey(name: 'salaryMonth')
  final int salaryMonth;
  @JsonKey(name: 'salaryYear')
  final int salaryYear;
  @JsonKey(name: 'leaveDays')
  final int leaveDays;
  @JsonKey(name: 'leaveAmount')
  final int leaveAmount;
  @JsonKey(name: 'basicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'isSettled')
  final dynamic isSettled;
  @JsonKey(name: 'settlementDate')
  final dynamic settlementDate;
  @JsonKey(name: 'settlementRemarks')
  final dynamic settlementRemarks;
  @JsonKey(name: 'referenceType')
  final dynamic referenceType;
  @JsonKey(name: 'referenceId')
  final dynamic referenceId;
  @JsonKey(name: 'remarks')
  final dynamic remarks;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;
  @JsonKey(name: 'employeeLeaveEncashmentDetailsPaymentTypes')
  final List<RemoteEmployeeLeaveEncashmentDetailsPaymentTypes>?
      employeeLeaveEncashmentDetailsPaymentTypes;

  RemoteDetailsDto({
    required this.id,
    required this.employeeLeaveEncashmentId,
    required this.salaryMonth,
    required this.salaryYear,
    required this.leaveDays,
    required this.leaveAmount,
    required this.basicSalaryAmount,
    required this.isSettled,
    required this.settlementDate,
    required this.settlementRemarks,
    required this.referenceType,
    required this.referenceId,
    required this.remarks,
    required this.isDeleted,
    required this.employeeLeaveEncashmentDetailsPaymentTypes,
  });

  factory RemoteDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDetailsDtoToJson(this);
}
