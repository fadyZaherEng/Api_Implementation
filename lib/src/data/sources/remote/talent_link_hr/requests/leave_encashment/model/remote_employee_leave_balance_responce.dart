




import 'package:json_annotation/json_annotation.dart';

part 'remote_employee_leave_balance_responce.g.dart';

@JsonSerializable()
class RemoteEmployeeLeaveBalanceResponse {
  @JsonKey(name: 'isAllowYearlyBalance')
  final bool isAllowYearlyBalance;
  @JsonKey(name: 'currentBalance')
  final dynamic currentBalance;
  @JsonKey(name: 'yearlyBalance')
  final dynamic yearlyBalance;
  @JsonKey(name: 'leaveDays')
  final dynamic leaveDays;
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;

  RemoteEmployeeLeaveBalanceResponse({
    required this.isAllowYearlyBalance,
    required this.currentBalance,
    required this.yearlyBalance,
    required this.leaveDays,
    required this.status,
    required this.message,
  });

  factory RemoteEmployeeLeaveBalanceResponse.fromJson(
      Map<String, dynamic> json) =>
      _$RemoteEmployeeLeaveBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteEmployeeLeaveBalanceResponseToJson(this);
}
