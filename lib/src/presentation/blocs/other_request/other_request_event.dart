part of 'other_request_bloc.dart';

@immutable
abstract class OtherRequestEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class OtherRequestBackEvent extends OtherRequestEvent {}

class OtherRequestOpenRequestBottomSheetEvent extends OtherRequestEvent {}

class OtherRequestSelectRequestEvent extends OtherRequestEvent {
  final RequestType requestType;

  OtherRequestSelectRequestEvent({required this.requestType});
}

class OtherRequestOpenUploadFileBottomSheetEvent extends OtherRequestEvent {
  final bool isMandatory;

  OtherRequestOpenUploadFileBottomSheetEvent({required this.isMandatory});
}

class OtherRequestOpenCameraEvent extends OtherRequestEvent {
  final bool isMandatory;

  OtherRequestOpenCameraEvent({required this.isMandatory});
}

class OtherRequestOpenGalleryEvent extends OtherRequestEvent {
  final bool isMandatory;

  OtherRequestOpenGalleryEvent({required this.isMandatory});
}

class OtherRequestOpenFileEvent extends OtherRequestEvent {
  final bool isMandatory;

  OtherRequestOpenFileEvent({required this.isMandatory});
}

class OtherRequestSelectFileEvent extends OtherRequestEvent {
  final String filePath;
  final bool isMandatory;

  OtherRequestSelectFileEvent(
      {required this.filePath, required this.isMandatory});
}

class OtherRequestDeleteFileEvent extends OtherRequestEvent {
  final String filePath;
  final bool isMandatory;

  OtherRequestDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class OtherRequestSubmitEvent extends OtherRequestEvent {
  final List<OtherRequest> otherRequests;
  final String file;
  final String requestedDate;
  final OtherRequestController otherRequestController;

  OtherRequestSubmitEvent({
    required this.requestedDate,
    required this.otherRequestController,
    required this.file,
    required this.otherRequests,
  });
}

class OtherRequestValidationRequestEvent extends OtherRequestEvent {
  final String value;

  OtherRequestValidationRequestEvent({required this.value});
}

class OtherRequestValidationRequestDateEvent extends OtherRequestEvent {
  final String value;

  OtherRequestValidationRequestDateEvent({required this.value});
}

class OtherRequestValidationRemarkEvent extends OtherRequestEvent {
  final String value;
  final bool isMandatory;

  OtherRequestValidationRemarkEvent({
    required this.value,
    required this.isMandatory,
  });
}

class OtherRequestValidationNotesEvent extends OtherRequestEvent {
  final String value;
  final bool isMandatory;

  OtherRequestValidationNotesEvent({
    required this.value,
    required this.isMandatory,
  });
}

class OtherRequestValidationFileEvent extends OtherRequestEvent {
  final String value;
  final bool isMandatory;

  OtherRequestValidationFileEvent({
    required this.value,
    required this.isMandatory,
  });
}
class GetOtherRequestTypesEvent extends OtherRequestEvent {}
