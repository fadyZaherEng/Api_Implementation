import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';

class ResumeDutyFunctions {
  final Function() onTapReferenceType;
  final Function() onTapReferenceData;
  final Function() onTapPaymentMethod;
  final Function() onDeleteActualResumeDutyDateAction;
  final Function() onTapSubmit;
  final void Function(String value) onPickActualResumeDutyDate;
  final void Function(SingleSelectionModel value) onSelectRadioButton;
  final void Function(String value, bool isMandatory) onChangeRemarks;
  final void Function(String value, bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;

  ResumeDutyFunctions({
    required this.onSelectRadioButton,
    required this.onTapPaymentMethod,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
    required this.onDeleteActualResumeDutyDateAction,
    required this.onPickActualResumeDutyDate,
    required this.onTapReferenceData,
    required this.onTapReferenceType,
    required this.onTapSubmit,
  });
}
