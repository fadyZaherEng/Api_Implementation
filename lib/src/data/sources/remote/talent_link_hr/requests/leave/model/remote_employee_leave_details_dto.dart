import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_employee_leave_details_types.dart';
part 'remote_employee_leave_details_dto.g.dart';

@JsonSerializable()
class RemoteEmployeeLeaveDetailsDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'employeeLeaveId')
  final dynamic employeeLeaveId;
  @JsonKey(name: 'salaryMonth')
  final int? salaryMonth;
  @JsonKey(name: 'salaryYear')
  final int?salaryYear;
  @JsonKey(name: 'fromDate')
  final String ?fromDate;
  @JsonKey(name: 'toDate')
  final String ?toDate;
  @JsonKey(name: 'calendarDays')
  final int? calendarDays;
  @JsonKey(name: 'workingDays')
  final int? workingDays;
  @JsonKey(name: 'leaveDays')
  final dynamic leaveDays;
  @JsonKey(name: 'weekendDays')
  final int? weekendDays;
  @JsonKey(name: 'publicHolidays')
  final int? publicHolidays;
  @JsonKey(name: 'workingDaysAmount')
  final int? workingDaysAmount;
  @JsonKey(name: 'workingDaysDeductionAmount')
  final int? workingDaysDeductionAmount;
  @JsonKey(name: 'leaveAmount')
  final dynamic leaveAmount;
  @JsonKey(name: 'leaveDeductionAmount')
  final int? leaveDeductionAmount;
  @JsonKey(name: 'weekendAmount')
  final int? weekendAmount;
  @JsonKey(name: 'weekendDeductionAmount')
  final int? weekendDeductionAmount;
  @JsonKey(name: 'publicHolidayAmount')
  final int? publicHolidayAmount;
  @JsonKey(name: 'publicHolidayDeductionAmount')
  final dynamic publicHolidayDeductionAmount;
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
  final bool? isDeleted;
  @JsonKey(name: 'employeeLeaveDetailsTypes')
  final RemoteEmployeeLeaveDetailsTypes? employeeLeaveDetailsTypes;

  RemoteEmployeeLeaveDetailsDto({
    this.id,
    this.employeeLeaveId,
    this.salaryMonth,
    this.salaryYear,
    this.fromDate,
    this.toDate,
    this.calendarDays,
    this.workingDays,
    this.leaveDays,
    this.weekendDays,
    this.publicHolidays,
    this.workingDaysAmount,
    this.workingDaysDeductionAmount,
    this.leaveAmount,
    this.leaveDeductionAmount,
    this.weekendAmount,
    this.weekendDeductionAmount,
    this.publicHolidayAmount,
    this.publicHolidayDeductionAmount,
    this.isSettled,
    this.settlementDate,
    this.settlementRemarks,
    this.referenceType,
    this.referenceId,
    this.remarks,
    this.isDeleted,
    this.employeeLeaveDetailsTypes,
  });

  factory RemoteEmployeeLeaveDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteEmployeeLeaveDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEmployeeLeaveDetailsDtoToJson(this);
}
