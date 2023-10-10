part of 'half_day_leave_bloc.dart';

@immutable
abstract class HalfDayLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class HalfDayLeaveBackEvent extends HalfDayLeaveEvent {}

class HalfDayLeaveOpenHalfLeaveTypeBottomSheetEvent extends HalfDayLeaveEvent {}

class HalfDayLeaveSelectHalfLeaveTypeEvent extends HalfDayLeaveEvent {
  final RequestType halfLeaveType;

  HalfDayLeaveSelectHalfLeaveTypeEvent({
    required this.halfLeaveType,
  });
}

class HalfDayLeaveOpenUploadFileBottomSheetEvent extends HalfDayLeaveEvent {
  final bool isMandatory;

  HalfDayLeaveOpenUploadFileBottomSheetEvent({
    required this.isMandatory,
  });
}

class HalfDayLeaveOpenCameraEvent extends HalfDayLeaveEvent {
  final bool isMandatory;

  HalfDayLeaveOpenCameraEvent({
    required this.isMandatory,
  });
}

class HalfDayLeaveOpenGalleryEvent extends HalfDayLeaveEvent {
  final bool isMandatory;

  HalfDayLeaveOpenGalleryEvent({
    required this.isMandatory,
  });
}

class HalfDayLeaveOpenFileEvent extends HalfDayLeaveEvent {
  final bool isMandatory;

  HalfDayLeaveOpenFileEvent({
    required this.isMandatory,
  });
}

class HalfDayLeaveSelectFileEvent extends HalfDayLeaveEvent {
  final String filePath;
  final bool isMandatory;

  HalfDayLeaveSelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class HalfDayLeaveDeleteFileEvent extends HalfDayLeaveEvent {
  final String filePath;
  final bool isMandatory;

  HalfDayLeaveDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class HalfDayLeaveSubmitEvent extends HalfDayLeaveEvent {
  final String halfLeaveDate;
  final String startTime;
  final String endTime;
  final List<HalfDayLeave> halfDaysLeave;
  final String file;
  final HalfDayLeaveController halfDayLeaveController;

  HalfDayLeaveSubmitEvent({
    required this.halfLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.file,
    required this.halfDaysLeave,
    required this.halfDayLeaveController,
  });
}

class HalfDayLeaveValidationHalfLeaveTypeEvent extends HalfDayLeaveEvent {
  final String value;

  HalfDayLeaveValidationHalfLeaveTypeEvent({
    required this.value,
  });
}

class HalfDayLeaveValidationHalfLeaveDateEvent extends HalfDayLeaveEvent {
  final String value;

  HalfDayLeaveValidationHalfLeaveDateEvent({
    required this.value,
  });
}

class HalfDayLeaveValidationStartTimeEvent extends HalfDayLeaveEvent {
  final String value;

  HalfDayLeaveValidationStartTimeEvent({
    required this.value,
  });
}

class HalfDayLeaveValidationEndTimeEvent extends HalfDayLeaveEvent {
  final String value;

  HalfDayLeaveValidationEndTimeEvent({
    required this.value,
  });
}

class HalfDayLeaveValidationNumberOfMinuteEvent extends HalfDayLeaveEvent {
  final String value;

  HalfDayLeaveValidationNumberOfMinuteEvent({
    required this.value,
  });
}

class HalfDayLeaveValidationReasonsEvent extends HalfDayLeaveEvent {
  final String value;
  final bool isMandatory;

  HalfDayLeaveValidationReasonsEvent({
    required this.value,
    required this.isMandatory,
  });
}

class HalfDayLeaveValidationRemarksEvent extends HalfDayLeaveEvent {
  final String value;
  final bool isMandatory;

  HalfDayLeaveValidationRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class HalfDayLeaveValidationFileEvent extends HalfDayLeaveEvent {
  final String value;
  final bool isMandatory;

  HalfDayLeaveValidationFileEvent({
    required this.value,
    required this.isMandatory,
  });
}
class GetHalfDayLeaveTypesEvent extends HalfDayLeaveEvent {}
