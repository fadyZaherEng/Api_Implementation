import 'package:json_annotation/json_annotation.dart';

part 'remote_get_employee_policy_profile_leave_encashment_details.g.dart';

@JsonSerializable()
class RemoteGetEmployeePolicyProfileLeaveEncashmentDetails {
  @JsonKey(name: 'leaveTypeId')
  final int leaveTypeId;
  @JsonKey(name: 'encashmentleaveTypeId')
  final int encashmentleaveTypeId;
  @JsonKey(name: 'leaveTypeName')
  final String leaveTypeName;
  @JsonKey(name: 'maximumDays')
  final int maximumDays;

  RemoteGetEmployeePolicyProfileLeaveEncashmentDetails({
    required this.leaveTypeId,
    required this.encashmentleaveTypeId,
    required this.leaveTypeName,
    required this.maximumDays,
  });

  factory RemoteGetEmployeePolicyProfileLeaveEncashmentDetails.fromJson(
      Map<String, dynamic> json) =>
      _$RemoteGetEmployeePolicyProfileLeaveEncashmentDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetEmployeePolicyProfileLeaveEncashmentDetailsToJson(this);
}
