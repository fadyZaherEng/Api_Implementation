class HalfDayLeaveFunctions {
  final Function() onTapHalfLeaveType;
  final Function() onTapSubmit;
  final Function() onDeleteHalfLeaveDateAction;
  final Function() onDeleteStartTimeAction;
  final Function() onDeleteEndTimeAction;
  final void Function(String value) onPickHalfLeaveDate;
  final void Function(String value) onPickStartTime;
  final void Function(String value) onPickEndTime;
  final void Function(String value) onChangeNumberOfMinute;
  final void Function(String value, bool isMandatory) onChangeRemarks;
  final void Function(String value, bool isMandatory) onChangeLeaveReasons;
  final void Function(String filePath, bool isMandatory) deleteFileAction;
  final void Function(bool isMandatory) showUploadFileBottomSheet;

  HalfDayLeaveFunctions({
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.onTapSubmit,
    required this.deleteFileAction,
    required this.onPickEndTime,
    required this.onPickStartTime,
    required this.onDeleteEndTimeAction,
    required this.onDeleteStartTimeAction,
    required this.onChangeLeaveReasons,
    required this.onChangeNumberOfMinute,
    required this.onDeleteHalfLeaveDateAction,
    required this.onPickHalfLeaveDate,
    required this.onTapHalfLeaveType,
  });
}
