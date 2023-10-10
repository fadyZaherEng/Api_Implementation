import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class IndemnityEncashmentFunctions {
  final Function() onTapPaymentMethod;
  final Function() onDeleteRequestedDateAction;
  final Function() onDeletePaymentMonthAction;
  final Function() onTapSubmit;
  final void Function(String value) onPickRequestedDate;
  final void Function(String value) onPickPaymentMonth;
  final void Function(String value) onChangeRequestedDays;
  final void Function(String value, bool isMandatory) onChangeRemarks;
  final void Function(String filePath, bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;
  final void Function(SingleSelectionModel value) onSelectRadioButton;

  IndemnityEncashmentFunctions({
    required this.onSelectRadioButton,
    required this.onTapPaymentMethod,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.onTapSubmit,
    required this.onChangeRequestedDays,
    required this.onDeletePaymentMonthAction,
    required this.onDeleteRequestedDateAction,
    required this.onPickPaymentMonth,
    required this.onPickRequestedDate,
    required this.deleteFileAction,
  });
}
