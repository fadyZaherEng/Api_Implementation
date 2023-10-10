import 'package:json_annotation/json_annotation.dart';

part 'remote_loan_policy_outputs.g.dart';

@JsonSerializable()
class RemoteLoanPolicyOutputs {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'indemnityServiceDays')
  final int indemnityServiceDays;
  @JsonKey(name: 'indemnityDays')
  final int indemnityDays;
  @JsonKey(name: 'indemnityAmount')
  final double indemnityAmount;
  @JsonKey(name: 'message')
  final dynamic message;

  RemoteLoanPolicyOutputs({
    required this.status,
    this.message,
    required this.indemnityServiceDays,
    required this.indemnityDays,
    required this.indemnityAmount,
  });

  factory RemoteLoanPolicyOutputs.fromJson(Map<String, dynamic> json) =>
      _$RemoteLoanPolicyOutputsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLoanPolicyOutputsToJson(this);
}
