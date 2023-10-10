import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class LoansFunctions {
  final Function() onTapType;
  final Function() onDeleteLoanRequestedDateAction;
  final Function() onDeleteLoanStartDateAction;
  final Function() onTapSubmit;
  final Function() onTapPaymentMethod;
  final Function() checkboxAction;
  final void Function(String value) onPickLoanRequestedDate;
  final void Function(String value) onPickLoanStartDate;
  final void Function(String value) onChangeLoanRequestedAmount;
  final void Function(String value) onChangeProfitRate;
  final void Function(String value) onChangeLoanTotalAmount;
  final void Function(String value) onChangeInstallments;
  final void Function(SingleSelectionModel value) onSelectRadioButton;
  final void Function(String value, bool isMandatory) onChangeRemarks;
  final void Function(String value, bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;

  LoansFunctions({
    required this.onTapType,
    required this.onSelectRadioButton,
    required this.onTapPaymentMethod,
    required this.checkboxAction,
    required this.onTapSubmit,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
    required this.onChangeInstallments,
    required this.onChangeLoanRequestedAmount,
    required this.onChangeLoanTotalAmount,
    required this.onChangeProfitRate,
    required this.onDeleteLoanRequestedDateAction,
    required this.onDeleteLoanStartDateAction,
    required this.onPickLoanRequestedDate,
    required this.onPickLoanStartDate,
  });
}
