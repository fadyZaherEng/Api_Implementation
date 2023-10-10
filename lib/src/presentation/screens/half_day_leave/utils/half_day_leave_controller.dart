import 'package:flutter/material.dart';

class HalfDayLeaveController {
  final TextEditingController halfLeaveType;
  final TextEditingController halfLeaveDate;
  final TextEditingController startTime;
  final TextEditingController endTime;
  final TextEditingController numberOfMinute;
  final TextEditingController leaveReasons;
  final TextEditingController remarks;

  HalfDayLeaveController({
    required this.halfLeaveType,
    required this.halfLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.numberOfMinute,
    required this.leaveReasons,
    required this.remarks,
  });
}
