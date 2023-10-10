import 'package:flutter/material.dart';

abstract class PayslipEvent {}

class PayslipGetDataEvent extends PayslipEvent {
  int year, month;

  PayslipGetDataEvent({
    required this.year,
    required this.month,
  });
}

class PayslipLeftArrowEvent extends PayslipEvent {}

class PayslipRightArrowEvent extends PayslipEvent {}

class PayslipSelectDateEvent extends PayslipEvent {
  BuildContext context;

  PayslipSelectDateEvent(this.context);
}
