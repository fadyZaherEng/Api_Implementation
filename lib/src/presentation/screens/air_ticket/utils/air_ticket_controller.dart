import 'package:flutter/material.dart';

class AirTicketController {
  final TextEditingController requestedDate;
  final TextEditingController airTicketDueMonth;
  final TextEditingController airTicketDueYear;
  final TextEditingController paymentMethod;

  AirTicketController({
    required this.requestedDate,
    required this.airTicketDueMonth,
    required this.airTicketDueYear,
    required this.paymentMethod,
  });
}
