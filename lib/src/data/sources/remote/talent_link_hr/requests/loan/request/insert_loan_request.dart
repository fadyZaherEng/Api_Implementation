import 'package:json_annotation/json_annotation.dart';

part 'insert_loan_request.g.dart';

@JsonSerializable()
class InsertLoanRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'loanTypeId')
  final int loanTypeId;
  @JsonKey(name: 'loanRequestedDate')
  final String loanRequestedDate;
  @JsonKey(name: 'loanRequestedAmount')
  final int loanRequestedAmount;
  @JsonKey(name: 'profitRate')
  final int profitRate;
  @JsonKey(name: 'loanTotalAmount')
  final int loanTotalAmount;
  @JsonKey(name: 'paymentStartMonth')
  final int paymentStartMonth;
  @JsonKey(name: 'paymentStartYear')
  final int paymentStartYear;
  @JsonKey(name: 'isByInstallmentAmount')
  final int isByInstallmentAmount;
  @JsonKey(name: 'installments')
  final int installments;
  @JsonKey(name: 'isByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'paymentMethodId')
  final int paymentMethodId;
  @JsonKey(name: 'salaryDeductionPercentage')
  final int salaryDeductionPercentage;
  @JsonKey(name: 'isClosed')
  final int isClosed;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'indemnityServiceDays')
  final int indemnityServiceDays;
  @JsonKey(name: 'indemnityDays')
  final int indemnityDays;
  @JsonKey(name: 'indemnityAmount')
  final int indemnityAmount;
  @JsonKey(name: 'basicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'allowancesAmount')
  final int allowancesAmount;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;
  @JsonKey(name: 'noOfDigits')
  final int noOfDigits;
  @JsonKey(name: 'currencyCode')
  final String currencyCode;

  InsertLoanRequest({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.loanTypeId,
    required this.loanRequestedDate,
    required this.loanRequestedAmount,
    required this.profitRate,
    required this.loanTotalAmount,
    required this.paymentStartMonth,
    required this.paymentStartYear,
    required this.isByInstallmentAmount,
    required this.installments,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.salaryDeductionPercentage,
    required this.isClosed,
    required this.remarks,
    required this.indemnityServiceDays,
    required this.indemnityDays,
    required this.indemnityAmount,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.transactionStatusId,
    required this.workFlowId,
    required this.noOfDigits,
    required this.currencyCode,
  });

  factory InsertLoanRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertLoanRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertLoanRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "loanTypeId": loanTypeId,
      "loanRequestedDate": loanRequestedDate,
      "loanRequestedAmount": loanRequestedAmount,
      "profitRate": profitRate,
      "loanTotalAmount": loanTotalAmount,
      "paymentStartMonth": paymentStartMonth,
      "paymentStartYear": paymentStartYear,
      "isByInstallmentAmount": isByInstallmentAmount,
      "installments": installments,
      "isByPayroll": isByPayroll,
      "paymentMethodId": paymentMethodId,
      "salaryDeductionPercentage": salaryDeductionPercentage,
      "isClosed": isClosed,
      "remarks": remarks,
      "indemnityServiceDays": indemnityServiceDays,
      "indemnityDays": indemnityDays,
      "indemnityAmount": indemnityAmount,
      "basicSalaryAmount": basicSalaryAmount,
      "allowancesAmount": allowancesAmount,
      "transactionStatusId": transactionStatusId,
      "workFlowId": workFlowId,
      "noOfDigits": noOfDigits,
      "currencyCode": currencyCode,
    };
  }

  factory InsertLoanRequest.fromMap(Map<String, dynamic> map) {
    return InsertLoanRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      loanTypeId: map['loanTypeId'] as int,
      loanRequestedDate: map['loanRequestedDate'] as String,
      loanRequestedAmount: map['loanRequestedAmount'] as int,
      profitRate: map['profitRate'] as int,
      loanTotalAmount: map['loanTotalAmount'] as int,
      paymentStartMonth: map['paymentStartMonth'] as int,
      paymentStartYear: map['paymentStartYear'] as int,
      isByInstallmentAmount: map['isByInstallmentAmount'] as int,
      installments: map['installments'] as int,
      isByPayroll: map['isByPayroll'] as int,
      paymentMethodId: map['paymentMethodId'] as int,
      salaryDeductionPercentage: map['salaryDeductionPercentage'] as int,
      isClosed: map['isClosed'] as int,
      remarks: map['remarks'] as String,
      indemnityServiceDays: map['indemnityServiceDays'] as int,
      indemnityDays: map['indemnityDays'] as int,
      indemnityAmount: map['indemnityAmount'] as int,
      basicSalaryAmount: map['basicSalaryAmount'] as int,
      allowancesAmount: map['allowancesAmount'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      workFlowId: map['workFlowId'] as int,
      noOfDigits: map['noOfDigits'] as int,
      currencyCode: map['currencyCode'] as String,
    );
  }
}
