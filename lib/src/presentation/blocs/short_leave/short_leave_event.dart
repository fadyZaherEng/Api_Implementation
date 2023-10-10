part of 'short_leave_bloc.dart';

@immutable
abstract class ShortLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ShortLeaveBackEvent extends ShortLeaveEvent {}

class OpenTypeBottomSheetEvent extends ShortLeaveEvent {}

class SelectShortLeaveTypeEvent extends ShortLeaveEvent {
  final RequestType shortLeaveType;

  SelectShortLeaveTypeEvent({
    required this.shortLeaveType,
  });
}

class OpenUploadFileBottomSheetEvent extends ShortLeaveEvent {
  final bool isMandatory;

  OpenUploadFileBottomSheetEvent({required this.isMandatory});
}

class ShortLeaveOpenCameraEvent extends ShortLeaveEvent {
  final bool isMandatory;

  ShortLeaveOpenCameraEvent({required this.isMandatory});
}

class ShortLeaveOpenGalleryEvent extends ShortLeaveEvent {
  final bool isMandatory;

  ShortLeaveOpenGalleryEvent({required this.isMandatory});
}

class ShortLeaveOpenFileEvent extends ShortLeaveEvent {
  final bool isMandatory;

  ShortLeaveOpenFileEvent({required this.isMandatory});
}

class ShortLeaveSelectFileEvent extends ShortLeaveEvent {
  final String filePath;
  final bool isMandatory;

  ShortLeaveSelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ShortLeaveDeleteFileEvent extends ShortLeaveEvent {
  final String filePath;
  final bool isMandatory;

  ShortLeaveDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ShortLeaveSubmitEvent extends ShortLeaveEvent {
  final String date;
  final String startTime;
  final String endTime;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final String file;
  final ShortLeaveController shortLeaveController;

  ShortLeaveSubmitEvent({
    required this.shortLeaveController,
    required this.allFieldsMandatory,
    required this.file,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}

class ValidateShortLeaveTypeEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveTypeEvent({
    required this.value,
  });
}

class ValidateShortLeaveDateEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveDateEvent({
    required this.value,
  });
}

class ValidateShortLeaveStartTimeEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveStartTimeEvent({
    required this.value,
  });
}

class ValidateShortLeaveEndTimeEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveEndTimeEvent({
    required this.value,
  });
}

class ValidateShortLeaveEndNumberOfMinutesEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveEndNumberOfMinutesEvent({
    required this.value,
  });
}

class ValidateShortLeaveReferenceNameEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveReferenceNameEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveYearlyBalanceEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveYearlyBalanceEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveReasonsEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveReasonsEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveRemarksEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveFileEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class GetShortLeaveTypesEvent extends ShortLeaveEvent {}

class GetAllFieldsMandatoryEvent extends ShortLeaveEvent {
  final int requestTypeId;
  final int requestData;

  GetAllFieldsMandatoryEvent({
    required this.requestData,
    required this.requestTypeId,
  });
}
