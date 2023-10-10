import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_short_leave_request.g.dart';

@JsonSerializable()
class CalculateInCaseShortLeaveRequest {
  @JsonKey(name: 'EmployeeId')
  final int? employeeId;
  @JsonKey(name: 'ShortLeaveTypeId')
  final int? shortLeaveTypeId;
  @JsonKey(name: 'ShortLeaveDate')
  final String? shortLeaveDate;
  @JsonKey(name: 'StartTime')
  final String? startTime;
  @JsonKey(name: 'EndTime')
  final String? endTime;

  CalculateInCaseShortLeaveRequest({
    required this.employeeId,
    required this.shortLeaveTypeId,
    required this.shortLeaveDate,
    required this.startTime,
    required this.endTime,
  });

  factory CalculateInCaseShortLeaveRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateInCaseShortLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalculateInCaseShortLeaveRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "EmployeeId": employeeId,
      "ShortLeaveTypeId": shortLeaveTypeId,
      "ShortLeaveDate": shortLeaveDate,
      "StartTime": startTime,
      "EndTime": endTime,
    };
  }

  factory CalculateInCaseShortLeaveRequest.fromMap(Map<String, dynamic> map) {
    return CalculateInCaseShortLeaveRequest(
      employeeId: map['EmployeeId'] as int,
      shortLeaveTypeId: map['ShortLeaveTypeId'] as int,
      shortLeaveDate: map['ShortLeaveDate'] as String,
      startTime: map['StartTime'] as String,
      endTime: map['IsByPayroll'] as String,
    );
  }
}
