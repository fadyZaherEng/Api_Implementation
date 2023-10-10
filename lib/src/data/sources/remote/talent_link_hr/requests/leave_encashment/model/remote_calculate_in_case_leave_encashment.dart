import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_details_dto.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_employee_leave_balance_responce.dart';

part 'remote_calculate_in_case_leave_encashment.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseLeaveEncashment {
  @JsonKey(name: 'mainStatus')
  final bool? mainStatus;
  @JsonKey(name: 'mainMassage')
  final String? mainMassage;
  @JsonKey(name: 'validateMonthYearDto')
  final dynamic validateMonthYearDto;
  @JsonKey(name: 'employeeLeaveBalanceResponce')
  final RemoteEmployeeLeaveBalanceResponse? employeeLeaveBalanceResponse;
  @JsonKey(name: 'detailsDto')
  final RemoteDetailsDto? detailsDto;

  RemoteCalculateInCaseLeaveEncashment({
     this.mainStatus,
     this.mainMassage,
     this.validateMonthYearDto,
     this.employeeLeaveBalanceResponse,
     this.detailsDto,
  });

  factory RemoteCalculateInCaseLeaveEncashment.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseLeaveEncashmentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCalculateInCaseLeaveEncashmentToJson(this);
}
