import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_employee_leave_balance_response.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_employee_leave_details_dto.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_validate_month_year.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_calculate_in_case_new_leave.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseNewLeave {
  @JsonKey(name: 'mainStatus')
  final bool? mainStatus;
  @JsonKey(name: 'mainMassage')
  final String? mainMassage;
  @JsonKey(name: 'validateMonthYear')
  final RemoteValidateMonthYear? validateMonthYear;
  @JsonKey(name: 'employeeLeaveBalanceResponce')
  final RemoteEmployeeLeaveBalanceResponse? employeeLeaveBalanceResponse;
  @JsonKey(name: 'employeeLeaveDetailsDto')
  final RemoteEmployeeLeaveDetailsDto? employeeLeaveDetailsDto;
  @JsonKey(name: 'employeeLeaveDeductionDtos')
  final List<dynamic>? employeeLeaveDeductionDtos;
  @JsonKey(name: 'employeeLeaveAdditionDtos')
  final List<dynamic>? employeeLeaveAdditionDtos;

  RemoteCalculateInCaseNewLeave({
    this.mainStatus,
    this.mainMassage,
    this.validateMonthYear,
    this.employeeLeaveBalanceResponse,
    this.employeeLeaveDetailsDto,
    this.employeeLeaveDeductionDtos,
    this.employeeLeaveAdditionDtos,
  });

  factory RemoteCalculateInCaseNewLeave.fromJson(Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseNewLeaveFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCalculateInCaseNewLeaveToJson(this);
}
