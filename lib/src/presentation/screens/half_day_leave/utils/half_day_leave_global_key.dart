import 'package:flutter/material.dart';

class HalfDayLeaveGlobalKey {
  final GlobalKey halfLeaveType;
  final GlobalKey halfLeaveDate;
  final GlobalKey startTime;
  final GlobalKey endTime;
  final GlobalKey numberOfMinute;
  final GlobalKey leaveReasons;
  final GlobalKey remarks;
  final GlobalKey file;

  HalfDayLeaveGlobalKey({
    required this.halfLeaveType,
    required this.halfLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.numberOfMinute,
    required this.leaveReasons,
    required this.remarks,
    required this.file,
  });
}
