import 'package:flutter/cupertino.dart';

class LeaveEncashmentController {
  final TextEditingController type;
  final TextEditingController requestedDays;
  final TextEditingController paymentMethod;
  final TextEditingController currentBalance;
  final TextEditingController yearlyBalance;
  final TextEditingController remainingBalance;
  final TextEditingController totalAmount;
  final TextEditingController remarks;

  LeaveEncashmentController({
    required this.type,
    required this.requestedDays,
    required this.paymentMethod,
    required this.currentBalance,
    required this.yearlyBalance,
    required this.remainingBalance,
    required this.totalAmount,
    required this.remarks,
  });
}
