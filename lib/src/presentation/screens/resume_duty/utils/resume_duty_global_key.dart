import 'package:flutter/material.dart';

class ResumeDutyGlobalKey {
  final GlobalKey referenceType;
  final GlobalKey referenceData;
  final GlobalKey paymentMethod;
  final GlobalKey actualResumeDutyDate;
  final GlobalKey remarks;
  final GlobalKey file;

  ResumeDutyGlobalKey({
    required this.referenceType,
    required this.referenceData,
    required this.paymentMethod,
    required this.actualResumeDutyDate,
    required this.remarks,
    required this.file,
  });
}
