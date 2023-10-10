part of 'other_request_bloc.dart';

@immutable
abstract class OtherRequestState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class OtherRequestInitialState extends OtherRequestState {}

class OtherRequestLoadingState extends OtherRequestState {}

class OtherRequestBackState extends OtherRequestState {}

class OtherRequestOpenRequestBottomSheetState extends OtherRequestState {}

class OtherRequestSelectRequestState extends OtherRequestState {
  final RequestType requestType;

  OtherRequestSelectRequestState({required this.requestType});
}

class OtherRequestOpenUploadFileBottomSheetState extends OtherRequestState {
  final bool isMandatory;

  OtherRequestOpenUploadFileBottomSheetState({required this.isMandatory});
}

class OtherRequestOpenCameraState extends OtherRequestState {
  final bool isMandatory;

  OtherRequestOpenCameraState({required this.isMandatory});
}

class OtherRequestOpenGalleryState extends OtherRequestState {
  final bool isMandatory;

  OtherRequestOpenGalleryState({required this.isMandatory});
}

class OtherRequestOpenFileState extends OtherRequestState {
  final bool isMandatory;

  OtherRequestOpenFileState({required this.isMandatory});
}

class OtherRequestSelectFileState extends OtherRequestState {
  final String filePath;

  OtherRequestSelectFileState({required this.filePath});
}

class OtherRequestDeleteFileState extends OtherRequestState {
  final String filePath;

  OtherRequestDeleteFileState({required this.filePath});
}

class OtherRequestValidationRequestEmptyState extends OtherRequestState {
  final String validationMassage;

  OtherRequestValidationRequestEmptyState({required this.validationMassage});
}

class OtherRequestValidationRequestValidState extends OtherRequestState {}

class OtherRequestValidationRequestDateEmptyState extends OtherRequestState {
  final String validationMassage;

  OtherRequestValidationRequestDateEmptyState(
      {required this.validationMassage});
}

class OtherRequestValidationRequestDateValidState extends OtherRequestState {}

class OtherRequestValidationRemarksEmptyState extends OtherRequestState {
  final String validationMassage;

  OtherRequestValidationRemarksEmptyState({required this.validationMassage});
}

class OtherRequestValidationRemarksValidState extends OtherRequestState {}

class OtherRequestValidationNotesEmptyState extends OtherRequestState {
  final String validationMassage;

  OtherRequestValidationNotesEmptyState({required this.validationMassage});
}

class OtherRequestValidationNotesValidState extends OtherRequestState {}

class OtherRequestValidationFileEmptyState extends OtherRequestState {
  final String validationMassage;

  OtherRequestValidationFileEmptyState({required this.validationMassage});
}

class OtherRequestValidationFileValidState extends OtherRequestState {}

class OtherRequestSubmitSuccessState extends OtherRequestState {
  final String successMassage;

  OtherRequestSubmitSuccessState({required this.successMassage});
}

class GetOtherRequestTypesSuccessState extends OtherRequestState {
  final List<RequestType> otherRequestTypes;

  GetOtherRequestTypesSuccessState({required this.otherRequestTypes});
}

class GetOtherRequestTypesErrorState extends OtherRequestState {
  final String errorMassage;

  GetOtherRequestTypesErrorState({required this.errorMassage});
}
