import 'package:flutter/material.dart';

class ShortLeaveController {
  final TextEditingController type;
  final TextEditingController endNumberOfMinutes;
  final TextEditingController referenceName;
  final TextEditingController yearlyBalance;
  final TextEditingController leaveReasons;
  final TextEditingController remarks;

  ShortLeaveController({
    required this.type,
    required this.endNumberOfMinutes,
    required this.referenceName,
    required this.yearlyBalance,
    required this.leaveReasons,
    required this.remarks,
  });
}
