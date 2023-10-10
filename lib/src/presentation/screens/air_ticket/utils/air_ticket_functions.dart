import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class AirTicketFunctions {
  final Function() onDeleteRequestedDate;
  final Function() onTapAirTicketDueMonth;
  final Function() onTapAirTicketDueYear;
  final Function() onTapPaymentMethod;
  final Function() onTapSubmit;
  final void Function(String value) onPickRequestedDate;
  final void Function(SingleSelectionModel value) onSelectRadioButton;

  AirTicketFunctions({
    required this.onPickRequestedDate,
    required this.onTapAirTicketDueMonth,
    required this.onTapAirTicketDueYear,
    required this.onDeleteRequestedDate,
    required this.onSelectRadioButton,
    required this.onTapPaymentMethod,
    required this.onTapSubmit,
  });
}
