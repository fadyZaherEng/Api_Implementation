import 'package:flutter/cupertino.dart';

class LoansGlobalKey {
  final GlobalKey type;
  final GlobalKey loanRequestedDate;
  final GlobalKey loanStartDate;
  final GlobalKey loanRequestedAmount;
  final GlobalKey profitRate;
  final GlobalKey loanTotalAmount;
  final GlobalKey installments;
  final GlobalKey paymentMethod;
  final GlobalKey remarks;
  final GlobalKey file;

  LoansGlobalKey({
    required this.type,
    required this.loanRequestedDate,
    required this.loanStartDate,
    required this.loanRequestedAmount,
    required this.profitRate,
    required this.loanTotalAmount,
    required this.installments,
    required this.paymentMethod,
    required this.remarks,
    required this.file,
  });
}
