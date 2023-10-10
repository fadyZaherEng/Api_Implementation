import 'package:flutter/cupertino.dart';

class LoansController {
  final TextEditingController type;
  final TextEditingController loanRequestedAmount;
  final TextEditingController profitRate;
  final TextEditingController loanTotalAmount;
  final TextEditingController installments;
  final TextEditingController paymentMethod;
  final TextEditingController remarks;

  LoansController({
    required this.type,
    required this.loanRequestedAmount,
    required this.profitRate,
    required this.loanTotalAmount,
    required this.installments,
    required this.paymentMethod,
    required this.remarks,
  });
}
