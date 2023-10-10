import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class BusinessTripFunctions {
  final Function() onTapNext;
  final Function() onTapCountry;
  final Function() onTapCity;
  final Function() onTapBusinessTripType;
  final Function() onDeleteFlightDate;
  final Function() onDeleteReturnDate;
  final Function() onDeleteExpectedResumeDutyDate;
  final Function() onDeleteDepartureDate;
  final Function() onTapPaymentMethod;
  final Function() onDeleteActualResumeDutyDate;
  final Function() onTapAdd;
  final Function() showUploadFileBottomSheet;
  final Function() onTapBusinessTripStep;
  final Function() onTapDestinationStep;
  final Function() onTapVisaRequired;
  final void Function(String value) onPickDepartureDate;
  final void Function(String value) onPickReturnDate;
  final void Function(String value) onChangeDuration;
  final void Function(String value) onPickExpectedResumeDutyDate;
  final void Function(String value) onPickActualResumeDutyDate;
  final void Function(String value) onChangeTripPurpose;
  final void Function(String value) onPickFlightDate;
  final void Function(String value) onChangeVisaAmount;
  final void Function(String value) onChangeTicketAmount;
  final void Function(String value) onChangeHotelAmount;
  final void Function(String value) onChangePerDiemAmount;
  final void Function(String value) onChangeRemarks;
  final void Function(String value) deleteFileAction;
  final void Function(SingleSelectionModel value) onSelectRadioButton;

  BusinessTripFunctions({
    required this.onTapNext,
    required this.onTapCountry,
    required this.onTapCity,
    required this.onTapBusinessTripType,
    required this.onDeleteFlightDate,
    required this.onDeleteReturnDate,
    required this.onDeleteExpectedResumeDutyDate,
    required this.onDeleteDepartureDate,
    required this.onTapPaymentMethod,
    required this.onDeleteActualResumeDutyDate,
    required this.onTapAdd,
    required this.showUploadFileBottomSheet,
    required this.onPickDepartureDate,
    required this.onPickReturnDate,
    required this.onChangeDuration,
    required this.onPickActualResumeDutyDate,
    required this.onPickExpectedResumeDutyDate,
    required this.onChangeTripPurpose,
    required this.onPickFlightDate,
    required this.onChangeVisaAmount,
    required this.onChangeTicketAmount,
    required this.onChangeHotelAmount,
    required this.onChangePerDiemAmount,
    required this.onChangeRemarks,
    required this.deleteFileAction,
    required this.onSelectRadioButton,
    required this.onTapBusinessTripStep,
    required this.onTapDestinationStep,
    required this.onTapVisaRequired,
  });
}
