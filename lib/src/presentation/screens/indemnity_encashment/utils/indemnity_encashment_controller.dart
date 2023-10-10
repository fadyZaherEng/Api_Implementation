import 'package:flutter/material.dart';

class IndemnityEncashmentController {
  final TextEditingController requestedDate;
  final TextEditingController requestedDays;
  final TextEditingController paymentMonth;
  final TextEditingController paymentMethod;
  final TextEditingController remarks;

  IndemnityEncashmentController({
    required this.requestedDate,
    required this.requestedDays,
    required this.paymentMonth,
    required this.paymentMethod,
    required this.remarks,
  });
}
