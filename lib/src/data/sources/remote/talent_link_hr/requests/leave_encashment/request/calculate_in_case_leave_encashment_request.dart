import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_leave_encashment_request.g.dart';

@JsonSerializable()
class CalculateInCaseLeaveEncashmentRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'fromDate')
  final String fromDate;
  @JsonKey(name: 'leaveTypeId')
  final int leaveTypeId;
  @JsonKey(name: 'requestedDate')
  final String requestedDate;
  @JsonKey(name: 'requestedDays')
  final int requestedDays;

  CalculateInCaseLeaveEncashmentRequest({
    this.employeeId = 2220,
    this.fromDate = '',
    this.leaveTypeId = 0,
    this.requestedDate = '',
    this.requestedDays = 0,
  });

  factory CalculateInCaseLeaveEncashmentRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateInCaseLeaveEncashmentRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalculateInCaseLeaveEncashmentRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "employeeId": employeeId,
      "fromDate": fromDate,
      "leaveTypeId": leaveTypeId,
      "requestedDate": requestedDate,
      "requestedDays": requestedDays,
    };
  }

  factory CalculateInCaseLeaveEncashmentRequest.fromMap(
      Map<String, dynamic> map) {
    return CalculateInCaseLeaveEncashmentRequest(
      employeeId: map['employeeId'] as int,
      fromDate: map['fromDate'] as String,
      leaveTypeId: map['leaveTypeId'] as int,
      requestedDate: map['requestedDate'] as String,
      requestedDays: map['requestedDays'] as int,
    );
  }
}
