// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Chose File`
  String get choseFile {
    return Intl.message(
      'Chose File',
      name: 'choseFile',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Payslip`
  String get payslip {
    return Intl.message(
      'Payslip',
      name: 'payslip',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get leave {
    return Intl.message(
      'Leave',
      name: 'leave',
      desc: '',
      args: [],
    );
  }

  /// `Select...`
  String get select {
    return Intl.message(
      'Select...',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payroll`
  String get payroll {
    return Intl.message(
      'Payroll',
      name: 'payroll',
      desc: '',
      args: [],
    );
  }

  /// `Settlement`
  String get settlement {
    return Intl.message(
      'Settlement',
      name: 'settlement',
      desc: '',
      args: [],
    );
  }

  /// `Contact No`
  String get contactNo {
    return Intl.message(
      'Contact No',
      name: 'contactNo',
      desc: '',
      args: [],
    );
  }

  /// `Expected Resuming Date`
  String get expectedResumingDate {
    return Intl.message(
      'Expected Resuming Date',
      name: 'expectedResumingDate',
      desc: '',
      args: [],
    );
  }

  /// `Address During Leave`
  String get addressDuringLeave {
    return Intl.message(
      'Address During Leave',
      name: 'addressDuringLeave',
      desc: '',
      args: [],
    );
  }

  /// `Alternative Employee`
  String get alternativeEmployee {
    return Intl.message(
      'Alternative Employee',
      name: 'alternativeEmployee',
      desc: '',
      args: [],
    );
  }

  /// `By Current Balance`
  String get byCurrentBalance {
    return Intl.message(
      'By Current Balance',
      name: 'byCurrentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance`
  String get currentBalance {
    return Intl.message(
      'Current Balance',
      name: 'currentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Yearly Balance`
  String get yearlyBalance {
    return Intl.message(
      'Yearly Balance',
      name: 'yearlyBalance',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Balance`
  String get remainingBalance {
    return Intl.message(
      'Remaining Balance',
      name: 'remainingBalance',
      desc: '',
      args: [],
    );
  }

  /// `Leave Days`
  String get leaveDays {
    return Intl.message(
      'Leave Days',
      name: 'leaveDays',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Leave Reasons`
  String get leaveReasons {
    return Intl.message(
      'Leave Reasons',
      name: 'leaveReasons',
      desc: '',
      args: [],
    );
  }

  /// `Remarks`
  String get remarks {
    return Intl.message(
      'Remarks',
      name: 'remarks',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `You should have camera permission`
  String get youShouldHaveCameraPermission {
    return Intl.message(
      'You should have camera permission',
      name: 'youShouldHaveCameraPermission',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this file?`
  String get areYouSureYouWantToDeleteThisFile {
    return Intl.message(
      'Are you sure you want to delete this file?',
      name: 'areYouSureYouWantToDeleteThisFile',
      desc: '',
      args: [],
    );
  }

  /// `You should have storage permission`
  String get youShouldHaveStoragePermission {
    return Intl.message(
      'You should have storage permission',
      name: 'youShouldHaveStoragePermission',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Short Leave`
  String get shortLeave {
    return Intl.message(
      'Short Leave',
      name: 'shortLeave',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get startTime {
    return Intl.message(
      'Start Time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get endTime {
    return Intl.message(
      'End Time',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `End Number Of Minutes`
  String get endNumberOfMinutes {
    return Intl.message(
      'End Number Of Minutes',
      name: 'endNumberOfMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Reference Name`
  String get referenceName {
    return Intl.message(
      'Reference Name',
      name: 'referenceName',
      desc: '',
      args: [],
    );
  }

  /// `Leave Encashment`
  String get leaveEncashment {
    return Intl.message(
      'Leave Encashment',
      name: 'leaveEncashment',
      desc: '',
      args: [],
    );
  }

  /// `Requested Date`
  String get requestedDate {
    return Intl.message(
      'Requested Date',
      name: 'requestedDate',
      desc: '',
      args: [],
    );
  }

  /// `Requested Days`
  String get requestedDays {
    return Intl.message(
      'Requested Days',
      name: 'requestedDays',
      desc: '',
      args: [],
    );
  }

  /// `Indemnity Encashment`
  String get indemnityEncashment {
    return Intl.message(
      'Indemnity Encashment',
      name: 'indemnityEncashment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Month`
  String get paymentMonth {
    return Intl.message(
      'Payment Month',
      name: 'paymentMonth',
      desc: '',
      args: [],
    );
  }

  /// `maximum days`
  String get maximumDays {
    return Intl.message(
      'maximum days',
      name: 'maximumDays',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Days Is 80`
  String get maximumDaysIs80 {
    return Intl.message(
      'Maximum Days Is 80',
      name: 'maximumDaysIs80',
      desc: '',
      args: [],
    );
  }

  /// `loans`
  String get loans {
    return Intl.message(
      'loans',
      name: 'loans',
      desc: '',
      args: [],
    );
  }

  /// `Loan Requested Date`
  String get loanRequestedDate {
    return Intl.message(
      'Loan Requested Date',
      name: 'loanRequestedDate',
      desc: '',
      args: [],
    );
  }

  /// `Loan Start Date`
  String get loanStartDate {
    return Intl.message(
      'Loan Start Date',
      name: 'loanStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Loan Requested Amount`
  String get loanRequestedAmount {
    return Intl.message(
      'Loan Requested Amount',
      name: 'loanRequestedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Profit Rate`
  String get profitRate {
    return Intl.message(
      'Profit Rate',
      name: 'profitRate',
      desc: '',
      args: [],
    );
  }

  /// `Loan Total Amount`
  String get loanTotalAmount {
    return Intl.message(
      'Loan Total Amount',
      name: 'loanTotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Installments`
  String get installments {
    return Intl.message(
      'Installments',
      name: 'installments',
      desc: '',
      args: [],
    );
  }

  /// `Half Day Leave`
  String get halfDayLeave {
    return Intl.message(
      'Half Day Leave',
      name: 'halfDayLeave',
      desc: '',
      args: [],
    );
  }

  /// `Half Leave Type`
  String get halfLeaveType {
    return Intl.message(
      'Half Leave Type',
      name: 'halfLeaveType',
      desc: '',
      args: [],
    );
  }

  /// `Half Leave Date`
  String get halfLeaveDate {
    return Intl.message(
      'Half Leave Date',
      name: 'halfLeaveDate',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Minutes`
  String get numberOfMinutes {
    return Intl.message(
      'Number Of Minutes',
      name: 'numberOfMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Resume Duty`
  String get resumeDuty {
    return Intl.message(
      'Resume Duty',
      name: 'resumeDuty',
      desc: '',
      args: [],
    );
  }

  /// `Reference Type`
  String get referenceType {
    return Intl.message(
      'Reference Type',
      name: 'referenceType',
      desc: '',
      args: [],
    );
  }

  /// `Reference Data`
  String get referenceData {
    return Intl.message(
      'Reference Data',
      name: 'referenceData',
      desc: '',
      args: [],
    );
  }

  /// `Actual Resume Duty Date`
  String get actualResumeDutyDate {
    return Intl.message(
      'Actual Resume Duty Date',
      name: 'actualResumeDutyDate',
      desc: '',
      args: [],
    );
  }

  /// `Business Trip`
  String get businessTrip {
    return Intl.message(
      'Business Trip',
      name: 'businessTrip',
      desc: '',
      args: [],
    );
  }

  /// `Business Trip Type`
  String get businessTripType {
    return Intl.message(
      'Business Trip Type',
      name: 'businessTripType',
      desc: '',
      args: [],
    );
  }

  /// `Departure Date`
  String get departureDate {
    return Intl.message(
      'Departure Date',
      name: 'departureDate',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get returnDate {
    return Intl.message(
      'Return Date',
      name: 'returnDate',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Expected Resume Duty Date`
  String get expectedResumeDutyDate {
    return Intl.message(
      'Expected Resume Duty Date',
      name: 'expectedResumeDutyDate',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Flight Date`
  String get flightDate {
    return Intl.message(
      'Flight Date',
      name: 'flightDate',
      desc: '',
      args: [],
    );
  }

  /// `Visa Amount`
  String get visaAmount {
    return Intl.message(
      'Visa Amount',
      name: 'visaAmount',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Amount`
  String get ticketAmount {
    return Intl.message(
      'Ticket Amount',
      name: 'ticketAmount',
      desc: '',
      args: [],
    );
  }

  /// `Per Diem Amount`
  String get perDiemAmount {
    return Intl.message(
      'Per Diem Amount',
      name: 'perDiemAmount',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Hotel Amount`
  String get hotelAmount {
    return Intl.message(
      'Hotel Amount',
      name: 'hotelAmount',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get destination {
    return Intl.message(
      'Destination',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Trip Purpose`
  String get tripPurpose {
    return Intl.message(
      'Trip Purpose',
      name: 'tripPurpose',
      desc: '',
      args: [],
    );
  }

  /// `Air Ticket`
  String get airTicket {
    return Intl.message(
      'Air Ticket',
      name: 'airTicket',
      desc: '',
      args: [],
    );
  }

  /// `Air Ticket Due Month`
  String get airTicketDueMonth {
    return Intl.message(
      'Air Ticket Due Month',
      name: 'airTicketDueMonth',
      desc: '',
      args: [],
    );
  }

  /// `Air Ticket Due Year`
  String get airTicketDueYear {
    return Intl.message(
      'Air Ticket Due Year',
      name: 'airTicketDueYear',
      desc: '',
      args: [],
    );
  }

  /// `Other Request`
  String get otherRequest {
    return Intl.message(
      'Other Request',
      name: 'otherRequest',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `By Installment Amount`
  String get byInstallmentAmount {
    return Intl.message(
      'By Installment Amount',
      name: 'byInstallmentAmount',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Days Is`
  String get maximumDaysIs {
    return Intl.message(
      'Maximum Days Is',
      name: 'maximumDaysIs',
      desc: '',
      args: [],
    );
  }

  /// `Visa Required`
  String get visaRequired {
    return Intl.message(
      'Visa Required',
      name: 'visaRequired',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
