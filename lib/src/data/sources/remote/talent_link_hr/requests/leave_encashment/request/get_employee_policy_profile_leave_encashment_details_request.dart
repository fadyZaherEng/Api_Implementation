import 'package:json_annotation/json_annotation.dart';

part 'get_employee_policy_profile_leave_encashment_details_request.g.dart';

@JsonSerializable()
class GetEmployeePolicyProfileLeaveEncashmentDetailsRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  GetEmployeePolicyProfileLeaveEncashmentDetailsRequest({
     this.employeeId =2220,
  });

  factory GetEmployeePolicyProfileLeaveEncashmentDetailsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetEmployeePolicyProfileLeaveEncashmentDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetEmployeePolicyProfileLeaveEncashmentDetailsRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "employeeId": employeeId,
    };
  }

  factory GetEmployeePolicyProfileLeaveEncashmentDetailsRequest.fromMap(
      Map<String, dynamic> map) {
    return GetEmployeePolicyProfileLeaveEncashmentDetailsRequest(
      employeeId: map['employeeId'] as int,
    );
  }
}
