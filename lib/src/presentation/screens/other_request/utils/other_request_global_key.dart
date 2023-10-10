import 'package:flutter/material.dart';

class OtherRequestGlobalKey {
  final GlobalKey request;
  final GlobalKey requestedDate;
  final GlobalKey remarks;
  final GlobalKey notes;
  final GlobalKey file;

  OtherRequestGlobalKey({
    required this.request,
    required this.requestedDate,
    required this.remarks,
    required this.notes,
    required this.file,
  });
}
