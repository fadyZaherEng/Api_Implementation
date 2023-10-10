import 'package:flutter/material.dart';

class ResumeDutyController {
  final TextEditingController referenceType;
  final TextEditingController referenceData;
  final TextEditingController paymentMethod;
  final TextEditingController actualResumeDutyDate;
  final TextEditingController remarks;

  ResumeDutyController({
    required this.referenceType,
    required this.referenceData,
    required this.paymentMethod,
    required this.actualResumeDutyDate,
    required this.remarks,
  });
}
