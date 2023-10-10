import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_loan_policy_outputs.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_validate_month_year_dto.dart';

part 'remote_calculate_in_case_loan.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseLoan {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'loanPolicyOutputs')
  final RemoteLoanPolicyOutputs? loanPolicyOutputs;
  @JsonKey(name: 'validateMonthYearDto')
  final RemoteValidateMonthYearDto? validateMonthYearDto;

  RemoteCalculateInCaseLoan({
    this.status = false,
    this.message = '',
    this.loanPolicyOutputs,
    this.validateMonthYearDto,
  });

  factory RemoteCalculateInCaseLoan.fromJson(Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseLoanFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCalculateInCaseLoanToJson(this);
}
