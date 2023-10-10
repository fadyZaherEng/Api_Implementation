import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_new_leave_request.g.dart';

@JsonSerializable()
class CalculateInCaseNewLeaveRequest {
  @JsonKey(name: 'EmployeeId')
  final int? employeeId;
  @JsonKey(name: 'FromDate')
  final String? fromDate;
  @JsonKey(name: 'ToDate')
  final String? toDate;
  @JsonKey(name: 'LeaveTypeId')
  final int? leaveTypeId;
  @JsonKey(name: 'IsByPayroll')
  final int? isByPayroll;

  CalculateInCaseNewLeaveRequest({
    required this.employeeId,
    required this.leaveTypeId,
    required this.fromDate,
    required this.toDate,
    required this.isByPayroll,
  });

  factory CalculateInCaseNewLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$CalculateInCaseNewLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateInCaseNewLeaveRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "EmployeeId": employeeId,
      "FromDate": fromDate,
      "ToDate": toDate,
      "LeaveTypeId": leaveTypeId,
      "IsByPayroll": isByPayroll,
    };
  }

  factory CalculateInCaseNewLeaveRequest.fromMap(Map<String, dynamic> map) {
    return CalculateInCaseNewLeaveRequest(
      employeeId: map['EmployeeId'] as int,
      fromDate: map['FromDate'] as String,
      toDate: map['ToDate'] as String,
      leaveTypeId: map['LeaveTypeId'] as int,
      isByPayroll: map['IsByPayroll'] as int,
    );
  }
}
