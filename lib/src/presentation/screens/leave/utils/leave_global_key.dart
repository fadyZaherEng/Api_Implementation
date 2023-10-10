import 'package:flutter/material.dart';

class LeaveGlobalKey {
  final GlobalKey typeKey;
  final GlobalKey startDateKey;
  final GlobalKey endDateKey;
  final GlobalKey expectedResumingDateKey;
  final GlobalKey paymentMethodKey;
  final GlobalKey contactNoKey;
  final GlobalKey addressDuringLeaveKey;
  final GlobalKey alternativeEmployeeKey;
  final GlobalKey currentBalanceKey;
  final GlobalKey yearlyBalanceKey;
  final GlobalKey remainingBalanceKey;
  final GlobalKey leaveDaysKey;
  final GlobalKey totalAmountKey;
  final GlobalKey uploadFileKey;
  final GlobalKey remarksKey;
  final GlobalKey reasonsKey;

  LeaveGlobalKey({
    required this.expectedResumingDateKey,
    required this.contactNoKey,
    required this.addressDuringLeaveKey,
    required this.alternativeEmployeeKey,
    required this.endDateKey,
    required this.paymentMethodKey,
    required this.startDateKey,
    required this.typeKey,
    required this.currentBalanceKey,
    required this.yearlyBalanceKey,
    required this.remainingBalanceKey,
    required this.leaveDaysKey,
    required this.totalAmountKey,
    required this.uploadFileKey,
    required this.remarksKey,
    required this.reasonsKey,
  });
}
