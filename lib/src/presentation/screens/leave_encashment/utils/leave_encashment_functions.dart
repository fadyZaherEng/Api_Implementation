import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class LeaveEncashmentFunctions {
  final Function() onTapType;
  final Function() onDeleteRequestedDateAction;
  final Function() onTapPaymentMethod;
  final Function() checkboxAction;
  final Function() onTapSubmit;
  final void Function(String value) onPickRequestedDate;
  final void Function(String value) onChangeRequestedDays;
  final void Function(SingleSelectionModel value) onSelectRadioButton;
  final void Function(String value,bool isMandatory) onChangeCurrentBalance;
  final void Function(String value,bool isMandatory) onChangeYearlyBalance;
  final void Function(String value,bool isMandatory) onChangeRemainingBalance;
  final void Function(String value,bool isMandatory) onChangeTotalAmount;
  final void Function(String value,bool isMandatory) onChangeRemarks;
  final void Function(String value,bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;

  LeaveEncashmentFunctions({
    required this.onTapType,
    required this.onPickRequestedDate,
    required this.onDeleteRequestedDateAction,
    required this.onChangeRequestedDays,
    required this.onSelectRadioButton,
    required this.onTapPaymentMethod,
    required this.checkboxAction,
    required this.onTapSubmit,
    required this.onChangeCurrentBalance,
    required this.onChangeYearlyBalance,
    required this.onChangeRemainingBalance,
    required this.onChangeTotalAmount,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
  });
}
