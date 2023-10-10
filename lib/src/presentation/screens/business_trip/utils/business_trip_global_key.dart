import 'package:flutter/material.dart';

class BusinessTripGlobalKey {
  final GlobalKey businessTripType;
  final GlobalKey departureDate;
  final GlobalKey returnDate;
  final GlobalKey duration;
  final GlobalKey expectedResumeDutyDate;
  final GlobalKey paymentMethod;
  final GlobalKey actualResumeDutyDate;
  final GlobalKey tripPurpose;
  final GlobalKey country;
  final GlobalKey city;
  final GlobalKey flightDate;
  final GlobalKey visaAmount;
  final GlobalKey ticketAmount;
  final GlobalKey hotelAmount;
  final GlobalKey perDiemAmount;
  final GlobalKey remarks;
  final GlobalKey file;

  BusinessTripGlobalKey({
    required this.businessTripType,
    required this.departureDate,
    required this.returnDate,
    required this.duration,
    required this.expectedResumeDutyDate,
    required this.paymentMethod,
    required this.actualResumeDutyDate,
    required this.tripPurpose,
    required this.country,
    required this.city,
    required this.flightDate,
    required this.visaAmount,
    required this.ticketAmount,
    required this.hotelAmount,
    required this.perDiemAmount,
    required this.remarks,
    required this.file,
  });
}
