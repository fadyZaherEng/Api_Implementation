import 'package:json_annotation/json_annotation.dart';

part 'insert_leave_request.g.dart';

@JsonSerializable()
class InsertLeaveRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'leaveTypeId')
  final int leaveTypeId;
  @JsonKey(name: 'leaveStartDate')
  final String leaveStartDate;
  @JsonKey(name: 'leaveEndDate')
  final String leaveEndDate;
  @JsonKey(name: 'expectedResumeDuty')
  final String expectedResumeDuty;
  @JsonKey(name: 'isByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'paymentMethodId')
  final int paymentMethodId;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'leaveReason')
  final String leaveReason;
  @JsonKey(name: 'alternativeEmployeeId')
  final String alternativeEmployeeId;
  @JsonKey(name: 'emergencyContactNo')
  final String emergencyContactNo;
  @JsonKey(name: 'addressDuringLeave')
  final String addressDuringLeave;
  @JsonKey(name: 'isExtendedLeave')
  final int isExtendedLeave;
  @JsonKey(name: 'extendedEmployeeLeaveId')
  final int extendedEmployeeLeaveId;
  @JsonKey(name: 'totalAmount')
  final int totalAmount;
  @JsonKey(name: 'isByCurrentBalance')
  final int isByCurrentBalance;
  @JsonKey(name: 'currentBalance')
  final int currentBalance;
  @JsonKey(name: 'yearlyBalance')
  final int yearlyBalance;
  @JsonKey(name: 'remainingBalance')
  final int remainingBalance;
  @JsonKey(name: "basicSalaryAmount")
  final int basicSalaryAmount;
  @JsonKey(name: "allowancesAmount")
  final int allowancesAmount;
  @JsonKey(name: "leaveDays")
  final int leaveDays;
  @JsonKey(name: "transactionStatusId")
  final int transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String transactionStatusName;
  @JsonKey(name: "wfId")
  final int wfId;
  @JsonKey(name: "isAllowYearlyBalance")
  final int isAllowYearlyBalance;

  InsertLeaveRequest({
    required this.employeeId,
    required this.leaveTypeId,
    required this.leaveStartDate,
    required this.id,
    required this.companyId,
    required this.leaveEndDate,
    required this.expectedResumeDuty,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.remarks,
    required this.leaveReason,
    required this.alternativeEmployeeId,
    required this.emergencyContactNo,
    required this.addressDuringLeave,
    required this.isExtendedLeave,
    required this.extendedEmployeeLeaveId,
    required this.totalAmount,
    required this.isByCurrentBalance,
    required this.currentBalance,
    required this.yearlyBalance,
    required this.remainingBalance,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.leaveDays,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.wfId,
    required this.isAllowYearlyBalance,
  });

  factory InsertLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertLeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertLeaveRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "leaveTypeId": leaveTypeId,
      "leaveStartDate": leaveStartDate,
      "leaveEndDate": leaveEndDate,
      "expectedResumeDuty": expectedResumeDuty,
      "isByPayroll": isByPayroll,
      "paymentMethodId": paymentMethodId,
      "remarks": remarks,
      "leaveReason": leaveReason,
      "alternativeEmployeeId": alternativeEmployeeId,
      "emergencyContactNo": emergencyContactNo,
      "addressDuringLeave": addressDuringLeave,
      "isExtendedLeave": isExtendedLeave,
      "extendedEmployeeLeaveId": extendedEmployeeLeaveId,
      "totalAmount": totalAmount,
      "isByCurrentBalance": isByCurrentBalance,
      "currentBalance": currentBalance,
      "yearlyBalance": yearlyBalance,
      "remainingBalance": remainingBalance,
      "basicSalaryAmount": basicSalaryAmount,
      "allowancesAmount": allowancesAmount,
      "leaveDays": leaveDays,
      "transactionStatusId": transactionStatusId,
      "transactionStatusName": transactionStatusName,
      "wfId": wfId,
      "isAllowYearlyBalance": isAllowYearlyBalance
    };
  }

  factory InsertLeaveRequest.fromMap(Map<String, dynamic> map) {
    return InsertLeaveRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      leaveTypeId: map['leaveTypeId'] as int,
      leaveStartDate: map['leaveStartDate'] as String,
      leaveEndDate: map['leaveEndDate'] as String,
      expectedResumeDuty: map['expectedResumeDuty'] as String,
      isByPayroll: map['isByPayroll'] as int,
      paymentMethodId: map['paymentMethodId'] as int,
      remarks: map['remarks'] as String,
      leaveReason: map['leaveReason'] as String,
      alternativeEmployeeId: map['alternativeEmployeeId'] as String,
      emergencyContactNo: map['emergencyContactNo'] as String,
      addressDuringLeave: map['addressDuringLeave'] as String,
      isExtendedLeave: map['isExtendedLeave'] as int,
      extendedEmployeeLeaveId: map['extendedEmployeeLeaveId'] as int,
      totalAmount: map['totalAmount'] as int,
      isByCurrentBalance: map['isByCurrentBalance'] as int,
      currentBalance: map['currentBalance'] as int,
      yearlyBalance: map['yearlyBalance'] as int,
      remainingBalance: map['remainingBalance'] as int,
      basicSalaryAmount: map['basicSalaryAmount'] as int,
      allowancesAmount: map['allowancesAmount'] as int,
      leaveDays: map['leaveDays'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      transactionStatusName: map['transactionStatusName'] as String,
      wfId: map['wfId'] as int,
      isAllowYearlyBalance: map['isAllowYearlyBalance'] as int,
    );
  }
}
