import 'package:flutter/material.dart';

class LeaveTextEditingController {
  final TextEditingController typeController;
  final TextEditingController paymentMethodController;
  final TextEditingController contactNoController;
  final TextEditingController addressDuringLeaveController;
  final TextEditingController alternativeEmployeeController;
  final TextEditingController currentBalanceController;
  final TextEditingController yearlyBalanceController;
  final TextEditingController remainingBalanceController;
  final TextEditingController leaveDaysController;
  final TextEditingController totalAmountController;
  final TextEditingController leaveReasonsController;
  final TextEditingController remarksController;

  LeaveTextEditingController({
    required this.contactNoController,
    required this.addressDuringLeaveController,
    required this.alternativeEmployeeController,
    required this.paymentMethodController,
    required this.typeController,
    required this.currentBalanceController,
    required this.yearlyBalanceController,
    required this.remainingBalanceController,
    required this.leaveDaysController,
    required this.totalAmountController,
    required this.leaveReasonsController,
    required this.remarksController,
  });
}
