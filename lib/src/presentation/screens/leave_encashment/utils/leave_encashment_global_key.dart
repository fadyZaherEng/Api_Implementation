import 'package:flutter/cupertino.dart';

class LeaveEncashmentGlobalKey {
  final GlobalKey type;
  final GlobalKey requestedDate;
  final GlobalKey requestedDays;
  final GlobalKey paymentMethod;
  final GlobalKey currentBalance;
  final GlobalKey yearlyBalance;
  final GlobalKey remainingBalance;
  final GlobalKey totalAmount;
  final GlobalKey remarks;
  final GlobalKey uploadFile;

  LeaveEncashmentGlobalKey({
    required this.type,
    required this.requestedDate,
    required this.requestedDays,
    required this.paymentMethod,
    required this.currentBalance,
    required this.yearlyBalance,
    required this.remainingBalance,
    required this.totalAmount,
    required this.remarks,
    required this.uploadFile,
  });
}
