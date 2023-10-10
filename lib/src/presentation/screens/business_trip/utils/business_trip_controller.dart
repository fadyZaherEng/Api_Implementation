import 'package:flutter/material.dart';

class BusinessTripController {
  final TextEditingController businessTripType;
  final TextEditingController duration;
  final TextEditingController paymentMethod;
  final TextEditingController tripPurpose;
  final TextEditingController country;
  final TextEditingController city;
  final TextEditingController visaAmount;
  final TextEditingController ticketAmount;
  final TextEditingController hotelAmount;
  final TextEditingController perDiemAmount;
  final TextEditingController remarks;
  final TextEditingController expensesName;
  final TextEditingController expensesAmount;
  final TextEditingController departureDate;
  final TextEditingController returnDate;
  final TextEditingController expectedResumeDutyDate;
  final TextEditingController actualResumeDutyDate;
  final TextEditingController flightDate;

  BusinessTripController({
    required this.businessTripType,
    required this.duration,
    required this.paymentMethod,
    required this.tripPurpose,
    required this.country,
    required this.city,
    required this.visaAmount,
    required this.ticketAmount,
    required this.hotelAmount,
    required this.perDiemAmount,
    required this.remarks,
    required this.expensesName,
    required this.expensesAmount,
    required this.departureDate,
    required this.returnDate,
    required this.expectedResumeDutyDate,
    required this.actualResumeDutyDate,
    required this.flightDate,
  });
}
