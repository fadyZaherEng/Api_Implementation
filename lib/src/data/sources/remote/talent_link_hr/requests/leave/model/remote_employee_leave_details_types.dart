import 'package:json_annotation/json_annotation.dart';
part 'remote_employee_leave_details_types.g.dart';

@JsonSerializable()
class RemoteEmployeeLeaveDetailsTypes {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'employeeLeaveDetailsId')
  final dynamic employeeLeaveDetailsId;
  @JsonKey(name: 'leaveTypeId')
  final int? leaveTypeId;
  @JsonKey(name: 'leaveTypeName')
  final dynamic leaveTypeName;
  @JsonKey(name: 'fromDate')
  final String? fromDate;
  @JsonKey(name: 'toDate')
  final String? toDate;
  @JsonKey(name: 'leaveDays')
  final int? leaveDays;
  @JsonKey(name: 'leaveAmount')
  final int? leaveAmount;
  @JsonKey(name: 'leaveDeductionAmount')
  final int? leaveDeductionAmount;
  @JsonKey(name: 'weekendAmount')
  final int? weekendAmount;
  @JsonKey(name: 'weekendDeductionAmount')
  final int? weekendDeductionAmount;
  @JsonKey(name: 'publicHolidayAmount')
  final int? publicHolidayAmount;
  @JsonKey(name: 'publicHolidayDeductionAmount')
  final int? publicHolidayDeductionAmount;
  @JsonKey(name: 'basicSalaryAmount')
  final int? basicSalaryAmount;
  @JsonKey(name: 'basicSalaryDeductionAmount')
  final int? basicSalaryDeductionAmount;
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;
  @JsonKey(name: 'employeeLeaveDetailsTypesPaymentTypes')
  final dynamic employeeLeaveDetailsTypesPaymentTypes;

  RemoteEmployeeLeaveDetailsTypes({
    this.id,
    this.employeeLeaveDetailsId,
    this.leaveTypeId,
    this.leaveTypeName,
    this.fromDate,
    this.toDate,
    this.leaveDays,
    this.leaveAmount,
    this.leaveDeductionAmount,
    this.weekendAmount,
    this.weekendDeductionAmount,
    this.publicHolidayAmount,
    this.publicHolidayDeductionAmount,
    this.basicSalaryAmount,
    this.basicSalaryDeductionAmount,
    this.isDeleted,
    this.employeeLeaveDetailsTypesPaymentTypes,
  });

  factory RemoteEmployeeLeaveDetailsTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteEmployeeLeaveDetailsTypesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeLeaveDetailsTypesToJson(this);
}
