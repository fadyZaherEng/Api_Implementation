class OtherRequestFunctions {
  final Function() onTapRequest;
  final Function() onDeleteRequestedDate;
  final Function() onTapSubmit;
  final void Function(String value) onPickRequestedDate;
  final void Function(String value, bool isMandatory) onChangeRemarks;
  final void Function(String value, bool isMandatory) onChangeNotes;
  final void Function(String value, bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;

  OtherRequestFunctions({
    required this.onTapRequest,
    required this.onDeleteRequestedDate,
    required this.onTapSubmit,
    required this.onPickRequestedDate,
    required this.onChangeRemarks,
    required this.onChangeNotes,
    required this.deleteFileAction,
    required this.showUploadFileBottomSheet,
  });
}
