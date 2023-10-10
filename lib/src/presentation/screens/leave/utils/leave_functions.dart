import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class LeaveFunctions {
  final Function() onTapType;
  final Function() onTapPaymentMethod;
  final Function() onDeleteStartDateAction;
  final Function() onDeleteEndDateAction;
  final Function() checkboxAction;

  final Function() onTapSubmit;
  final void Function(String value) onPickStartDate;
  final void Function(String value) onPickEndDate;
  final void Function(SingleSelectionModel value) onSelectRadioButton;
  final void Function(String value, bool isMandatory)
      onPickExpectedResumingDate;
  final void Function(String value, bool isMandatory) onChangeContactNo;
  final void Function(String value, bool isMandatory)
      onChangeAddressDuringLeave;
  final void Function(String value, bool isMandatory) onChangeCurrentBalance;
  final void Function(String value, bool isMandatory) onChangeYearlyBalance;
  final void Function(String value, bool isMandatory) onChangeRemainingBalance;
  final void Function(String value, bool isMandatory) onChangeLeaveDays;
  final void Function(String value, bool isMandatory) onChangeTotalAmount;
  final void Function(String value, bool isMandatory) onChangeLeaveReasons;
  final void Function(String value, bool isMandatory) onChangeRemarks;
  final void Function(String value, bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) onTapAlternativeEmployee;
  final void Function(bool isMandatory) onDeletePickExpectedResumingDateAction;
  final Function(bool isMandatory) showUploadFileBottomSheet;

  LeaveFunctions({
    required this.onChangeContactNo,
    required this.onChangeAddressDuringLeave,
    required this.onDeleteEndDateAction,
    required this.onDeletePickExpectedResumingDateAction,
    required this.onDeleteStartDateAction,
    required this.onPickEndDate,
    required this.onPickExpectedResumingDate,
    required this.onPickStartDate,
    required this.onSelectRadioButton,
    required this.onTapAlternativeEmployee,
    required this.onTapPaymentMethod,
    required this.onTapType,
    required this.checkboxAction,
    required this.onChangeCurrentBalance,
    required this.onChangeYearlyBalance,
    required this.onChangeRemainingBalance,
    required this.onChangeLeaveDays,
    required this.onChangeTotalAmount,
    required this.onChangeLeaveReasons,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
    required this.onTapSubmit,
  });
}
