part of 'short_leave_bloc.dart';

@immutable
abstract class ShortLeaveState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ShortLeaveInitialState extends ShortLeaveState {}

class ShortLeaveLoadingState extends ShortLeaveState {}

class ShortLeaveBackState extends ShortLeaveState {}

class OpenTypeBottomSheetState extends ShortLeaveState {}

class SelectShortLeaveTypeState extends ShortLeaveState {
  final RequestType shortLeaveType;

  SelectShortLeaveTypeState({
    required this.shortLeaveType,
  });
}

class OpenUploadFileBottomSheetState extends ShortLeaveState {
  final bool isMandatory;

  OpenUploadFileBottomSheetState({required this.isMandatory});
}

class ShortLeaveOpenCameraState extends ShortLeaveState {
  final bool isMandatory;

  ShortLeaveOpenCameraState({required this.isMandatory});
}

class ShortLeaveOpenGalleryState extends ShortLeaveState {
  final bool isMandatory;

  ShortLeaveOpenGalleryState({required this.isMandatory});
}

class ShortLeaveOpenFileState extends ShortLeaveState {
  final bool isMandatory;

  ShortLeaveOpenFileState({required this.isMandatory});
}

class ShortLeaveSelectFileState extends ShortLeaveState {
  final String filePath;

  ShortLeaveSelectFileState({
    required this.filePath,
  });
}

class ShortLeaveDeleteFileState extends ShortLeaveState {
  final String filePath;

  ShortLeaveDeleteFileState({
    required this.filePath,
  });
}

class ShortLeaveTypeEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveTypeEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveTypeValidState extends ShortLeaveState {}

class ShortLeaveDateEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveDateEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveDateValidState extends ShortLeaveState {}

class ShortLeaveStartTimeEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveStartTimeEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveStartTimeValidState extends ShortLeaveState {}

class ShortLeaveEndTimeEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveEndTimeEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveEndTimeValidState extends ShortLeaveState {}

class ShortLeaveEndNumberOfMinuteEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveEndNumberOfMinuteEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveEndNumberOfMinuteValidState extends ShortLeaveState {}

class ShortLeaveReferenceNameEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveReferenceNameEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveReferenceNameValidState extends ShortLeaveState {}

class ShortLeaveYearlyBalanceEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveYearlyBalanceEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveYearlyBalanceValidState extends ShortLeaveState {}

class ShortLeaveReasonsEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveReasonsEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveReasonsValidState extends ShortLeaveState {}

class ShortLeaveRemarksEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveRemarksEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveRemarksValidState extends ShortLeaveState {}

class ShortLeaveFileEmptyState extends ShortLeaveState {
  final String validationMessage;

  ShortLeaveFileEmptyState({
    required this.validationMessage,
  });
}

class ShortLeaveFileValidState extends ShortLeaveState {}

class ShortLeaveSubmitSuccessState extends ShortLeaveState {
  final String successMassage;

  ShortLeaveSubmitSuccessState({
    required this.successMassage,
  });
}

class GetShortLeaveTypesSuccessState extends ShortLeaveState {
  final List<RequestType> requestTypes;

  GetShortLeaveTypesSuccessState({
    required this.requestTypes,
  });
}

class GetShortLeaveTypesErrorState extends ShortLeaveState {
  final String errorMassage;

  GetShortLeaveTypesErrorState({
    required this.errorMassage,
  });
}

class GetAllFieldsMandatorySuccessState extends ShortLeaveState {
  final List<AllFieldsMandatory> allFieldsMandatory;

  GetAllFieldsMandatorySuccessState({
    required this.allFieldsMandatory,
  });
}

class GetAllFieldsMandatoryErrorState extends ShortLeaveState {
  final String errorMassage;

  GetAllFieldsMandatoryErrorState({
    required this.errorMassage,
  });
}
