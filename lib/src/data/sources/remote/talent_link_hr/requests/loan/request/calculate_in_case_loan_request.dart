import 'package:json_annotation/json_annotation.dart';

part 'calculate_in_case_loan_request.g.dart';

@JsonSerializable()
class CalculateInCaseLoanRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'toDate')
  final String toDate;
  @JsonKey(name: 'totalAmount')
  final int totalAmount;
  @JsonKey(name: 'isByInstallmentAmount')
  final int isByInstallmentAmount;
  @JsonKey(name: 'installements')
  final int installements;
  @JsonKey(name: 'loanStartDate')
  final String loanStartDate;

  CalculateInCaseLoanRequest({
    this.employeeId = 2220,
    required this.toDate,
    required this.totalAmount,
    required this.isByInstallmentAmount,
    required this.installements,
    required this.loanStartDate,
  });

  factory CalculateInCaseLoanRequest.fromJson(Map<String, dynamic> json) =>
      _$CalculateInCaseLoanRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateInCaseLoanRequestToJson(this);



  Map<String, dynamic> toMap() {
    return {
      "employeeId": employeeId,
      "toDate": toDate,
      "totalAmount": totalAmount,
      "isByInstallmentAmount": isByInstallmentAmount,
      "installements": installements,
      "loanStartDate": loanStartDate,

    };
  }

  factory CalculateInCaseLoanRequest.fromMap(Map<String, dynamic> map) {
    return CalculateInCaseLoanRequest(
      employeeId: map['employeeId'] as int,
      toDate: map['toDate'] as String,
      totalAmount: map['totalAmount'] as int,
      isByInstallmentAmount: map['isByInstallmentAmount'] as int,
      installements: map['installements'] as int,
      loanStartDate: map['loanStartDate'] as String,
    );
  }
}
