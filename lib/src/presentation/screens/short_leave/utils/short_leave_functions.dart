class ShortLeaveFunctions {
  final Function() onTapType;
  final Function() onDeleteDate;
  final Function() onDeleteStartTime;
  final Function() onDeleteEndTime;
  final Function() onTapSubmit;
  final void Function(String value) onPickDate;
  final void Function(String value) onPickStartTime;
  final void Function(String value) onPickEndTime;
  final void Function(String value) onChangeEndNumberOfMinutes;
  final void Function(String value,bool isMandatory) onChangeReferenceName;
  final void Function(String value,bool isMandatory) onChangeYearlyBalance;
  final void Function(String value,bool isMandatory) onChangeLeaveReasons;
  final void Function(String value,bool isMandatory) onChangeRemarks;
  final void Function(String value,bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;

  ShortLeaveFunctions({
    required this.onTapType,
    required this.onDeleteDate,
    required this.onDeleteStartTime,
    required this.onDeleteEndTime,
    required this.onPickDate,
    required this.onPickStartTime,
    required this.onPickEndTime,
    required this.onChangeEndNumberOfMinutes,
    required this.onChangeReferenceName,
    required this.onTapSubmit,
    required this.onChangeYearlyBalance,
    required this.onChangeLeaveReasons,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
  });
}
