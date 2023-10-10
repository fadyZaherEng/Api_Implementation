part of 'half_day_leave_bloc.dart';

@immutable
abstract class HalfDayLeaveState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class HalfDayLeaveInitialState extends HalfDayLeaveState {}

class HalfDayLeaveLoadingState extends HalfDayLeaveState {}

class HalfDayLeaveBackState extends HalfDayLeaveState {}

class HalfDayLeaveOpenHalfLeaveTypeBottomSheetState extends HalfDayLeaveState {}

class HalfDayLeaveSelectHalfLeaveTypeState extends HalfDayLeaveState {
  final RequestType halfLeaveType;

  HalfDayLeaveSelectHalfLeaveTypeState({
    required this.halfLeaveType,
  });
}

class HalfDayLeaveOpenUploadFileBottomSheetState extends HalfDayLeaveState {
  final bool isMandatory;

  HalfDayLeaveOpenUploadFileBottomSheetState({
    required this.isMandatory,
  });
}

class HalfDayLeaveOpenCameraState extends HalfDayLeaveState {
  final bool isMandatory;

  HalfDayLeaveOpenCameraState({
    required this.isMandatory,
  });
}

class HalfDayLeaveOpenGalleryState extends HalfDayLeaveState {
  final bool isMandatory;

  HalfDayLeaveOpenGalleryState({
    required this.isMandatory,
  });
}

class HalfDayLeaveOpenFileState extends HalfDayLeaveState {
  final bool isMandatory;

  HalfDayLeaveOpenFileState({
    required this.isMandatory,
  });
}

class HalfDayLeaveSelectFileState extends HalfDayLeaveState {
  final String filePath;

  HalfDayLeaveSelectFileState({
    required this.filePath,
  });
}

class HalfDayLeaveDeleteFileState extends HalfDayLeaveState {
  final String filePath;

  HalfDayLeaveDeleteFileState({
    required this.filePath,
  });
}

class HalfDayLeaveHalfLeaveTypeEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveHalfLeaveTypeEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveHalfLeaveTypeValidState extends HalfDayLeaveState {}

class HalfDayLeaveHalfLeaveDateEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveHalfLeaveDateEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveHalfLeaveDateValidState extends HalfDayLeaveState {}

class HalfDayLeaveStartTimeEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveStartTimeEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveStartTimeValidState extends HalfDayLeaveState {}

class HalfDayLeaveEndTimeEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveEndTimeEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveEndTimeValidState extends HalfDayLeaveState {}

class HalfDayLeaveNumberOfMinuteEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveNumberOfMinuteEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveNumberOfMinuteValidState extends HalfDayLeaveState {}

class HalfDayLeaveReasonsEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveReasonsEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveReasonsValidState extends HalfDayLeaveState {}

class HalfDayLeaveRemarksEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveRemarksEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveRemarksValidState extends HalfDayLeaveState {}

class HalfDayLeaveFileEmptyState extends HalfDayLeaveState {
  final String validationMassage;

  HalfDayLeaveFileEmptyState({
    required this.validationMassage,
  });
}

class HalfDayLeaveFileValidState extends HalfDayLeaveState {}

class HalfDayLeaveSubmitSuccessState extends HalfDayLeaveState {
  final String successMassage;

  HalfDayLeaveSubmitSuccessState({
    required this.successMassage,
  });
}

class GetHalfDayLeaveTypesSuccessState extends HalfDayLeaveState {
  final List<RequestType> halfDayTypes;

  GetHalfDayLeaveTypesSuccessState({required this.halfDayTypes});
}

class GetHalfDayLeaveTypesErrorState extends HalfDayLeaveState {
  final String errorMassage;

  GetHalfDayLeaveTypesErrorState({required this.errorMassage});
}
