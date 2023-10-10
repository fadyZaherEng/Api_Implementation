import 'package:json_annotation/json_annotation.dart';

part 'remote_calculate_in_case_short_leave.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseShortLeave {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'currentBalance')
  final int? currentBalance;
  @JsonKey(name: 'remainingBalance')
  final int? remainingBalance;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'validateCollideDates')
  final dynamic validateCollideDates;

  RemoteCalculateInCaseShortLeave({
    this.status,
    this.currentBalance,
    this.remainingBalance,
    this.message,
    this.validateCollideDates,
  });

  factory RemoteCalculateInCaseShortLeave.fromJson(Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseShortLeaveFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCalculateInCaseShortLeaveToJson(this);
}
