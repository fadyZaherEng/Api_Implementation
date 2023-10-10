import 'package:json_annotation/json_annotation.dart';

part 'insert_leave_encashment_request.g.dart';

@JsonSerializable()
class InsertLeaveEncashmentRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'LeaveEncashmentId')
  final int leaveEncashmentId;
  @JsonKey(name: 'EncashmentLeaveTypeId')
  final int encashmentLeaveTypeId;
  @JsonKey(name: 'isByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'paymentMethodId')
  final int paymentMethodId;
  @JsonKey(name: 'RequestedDate')
  final String requestedDate;
  @JsonKey(name: 'RequestedDays')
  final int requestedDays;
  @JsonKey(name: 'TotalAmount')
  final int totalAmount;
  @JsonKey(name: 'IsByCurrentBalance')
  final int isByCurrentBalance;
  @JsonKey(name: 'currentBalance')
  final int currentBalance;
  @JsonKey(name: 'YearlyBalance')
  final int yearlyBalance;
  @JsonKey(name: 'remainingBalance')
  final int remainingBalance;
  @JsonKey(name: 'BasicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'AllowancesAmount')
  final int allowancesAmount;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'wfId')
  final int wfId;
  @JsonKey(name: 'isAllowYearlyBalance')
  final int isAllowYearlyBalance;

  InsertLeaveEncashmentRequest({
    required this.id,
    required this.companyId,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.remarks,
    required this.totalAmount,
    required this.isByCurrentBalance,
    required this.currentBalance,
    required this.yearlyBalance,
    required this.remainingBalance,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.transactionStatusId,
    required this.wfId,
    required this.isAllowYearlyBalance,
    required this.requestedDate,
    required this.requestedDays,
    required this.employeeId,
    required this.encashmentLeaveTypeId,
    required this.leaveEncashmentId,
  });

  factory InsertLeaveEncashmentRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertLeaveEncashmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertLeaveEncashmentRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "leaveEncashmentId": leaveEncashmentId,
      "encashmentLeaveTypeId": encashmentLeaveTypeId,
      "isByPayroll": isByPayroll,
      "paymentMethodId": paymentMethodId,
      "requestedDate": requestedDate,
      "requestedDays": requestedDays,
      "remarks": remarks,
      "totalAmount": totalAmount,
      "isByCurrentBalance": isByCurrentBalance,
      "currentBalance": currentBalance,
      "yearlyBalance": yearlyBalance,
      "remainingBalance": remainingBalance,
      "basicSalaryAmount": basicSalaryAmount,
      "allowancesAmount": allowancesAmount,
      "transactionStatusId": transactionStatusId,
      "wfId": wfId,
      "isAllowYearlyBalance": isAllowYearlyBalance
    };
  }

  factory InsertLeaveEncashmentRequest.fromMap(Map<String, dynamic> map) {
    return InsertLeaveEncashmentRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      isByPayroll: map['isByPayroll'] as int,
      paymentMethodId: map['paymentMethodId'] as int,
      remarks: map['remarks'] as String,
      totalAmount: map['totalAmount'] as int,
      isByCurrentBalance: map['isByCurrentBalance'] as int,
      currentBalance: map['currentBalance'] as int,
      yearlyBalance: map['yearlyBalance'] as int,
      remainingBalance: map['remainingBalance'] as int,
      basicSalaryAmount: map['basicSalaryAmount'] as int,
      allowancesAmount: map['allowancesAmount'] as int,
      wfId: map['wfId'] as int,
      isAllowYearlyBalance: map['isAllowYearlyBalance'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      requestedDate: map['RequestedDate'] as String,
      requestedDays: map['RequestedDays'] as int,
      encashmentLeaveTypeId: map['EncashmentLeaveTypeId'] as int,
      leaveEncashmentId:  map['LeaveEncashmentId'] as int,
    );
  }
}
