import 'package:flutter/material.dart';

class IndemnityEncashmentGlobalKey {
  final GlobalKey requestedDate;
  final GlobalKey requestedDays;
  final GlobalKey paymentMonth;
  final GlobalKey paymentMethod;
  final GlobalKey remarks;
  final GlobalKey file;

  IndemnityEncashmentGlobalKey({
    required this.file,
    required this.remarks,
    required this.paymentMethod,
    required this.requestedDate,
    required this.requestedDays,
    required this.paymentMonth,
  });
}
