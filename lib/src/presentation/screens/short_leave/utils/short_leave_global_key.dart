import 'package:flutter/material.dart';

class ShortLeaveGlobalKey {
  final GlobalKey type;
  final GlobalKey date;
  final GlobalKey startTime;
  final GlobalKey endTime;
  final GlobalKey endNumberOfMinuet;
  final GlobalKey referenceName;
  final GlobalKey yearlyBalance;
  final GlobalKey leaveReasons;
  final GlobalKey remarks;
  final GlobalKey uploadFile;

  ShortLeaveGlobalKey({
    required this.type,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.endNumberOfMinuet,
    required this.referenceName,
    required this.yearlyBalance,
    required this.leaveReasons,
    required this.remarks,
    required this.uploadFile,
  });
}
