import 'package:flutter/material.dart';

class AirTicketGlobalKey {
  final GlobalKey requestedDate;
  final GlobalKey airTicketDueMonth;
  final GlobalKey airTicketDueYear;
  final GlobalKey paymentMethod;

  AirTicketGlobalKey({
    required this.requestedDate,
    required this.airTicketDueMonth,
    required this.airTicketDueYear,
    required this.paymentMethod,
  });
}
