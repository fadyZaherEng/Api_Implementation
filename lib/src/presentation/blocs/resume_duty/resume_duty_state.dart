part of 'resume_duty_bloc.dart';

@immutable
abstract class ResumeDutyState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ResumeDutyInitialState extends ResumeDutyState {}

class ResumeDutyLoadingState extends ResumeDutyState {}

class ResumeDutyBackState extends ResumeDutyState {}

class ResumeDutyOpenReferenceTypeBottomSheetState extends ResumeDutyState {}

class ResumeDutyOpenReferenceDataBottomSheetState extends ResumeDutyState {}

class ResumeDutyOpenPaymentMethodBottomSheetState extends ResumeDutyState {}

class ResumeDutySelectReferenceTypeState extends ResumeDutyState {
  final RequestType requestType;

  ResumeDutySelectReferenceTypeState({
    required this.requestType,
  });
}

class ResumeDutySelectReferenceDataState extends ResumeDutyState {
  final RequestType requestType;

  ResumeDutySelectReferenceDataState({
    required this.requestType,
  });
}

class ResumeDutySelectPaymentMethodState extends ResumeDutyState {
  final RequestPaymentMethod requestType;

  ResumeDutySelectPaymentMethodState({
    required this.requestType,
  });
}

class ResumeDutyOpenUploadFileBottomSheetState extends ResumeDutyState {
  final bool isMandatory;

  ResumeDutyOpenUploadFileBottomSheetState({
    required this.isMandatory,
  });
}

class ResumeDutyOpenCameraState extends ResumeDutyState {
  final bool isMandatory;

  ResumeDutyOpenCameraState({
    required this.isMandatory,
  });
}

class ResumeDutyOpenGalleryState extends ResumeDutyState {
  final bool isMandatory;

  ResumeDutyOpenGalleryState({
    required this.isMandatory,
  });
}

class ResumeDutyOpenFileState extends ResumeDutyState {
  final bool isMandatory;

  ResumeDutyOpenFileState({
    required this.isMandatory,
  });
}

class ResumeDutySelectFileState extends ResumeDutyState {
  final String filePath;

  ResumeDutySelectFileState({
    required this.filePath,
  });
}

class ResumeDutyDeleteFileState extends ResumeDutyState {
  final String filePath;

  ResumeDutyDeleteFileState({
    required this.filePath,
  });
}

class ResumeDutyValidationReferenceTypeEmptyState extends ResumeDutyState {
  final String validationMassage;

  ResumeDutyValidationReferenceTypeEmptyState({
    required this.validationMassage,
  });
}

class ResumeDutyValidationReferenceTypeValidState extends ResumeDutyState {}

class ResumeDutyValidationReferenceDataEmptyState extends ResumeDutyState {
  final String validationMassage;

  ResumeDutyValidationReferenceDataEmptyState({
    required this.validationMassage,
  });
}

class ResumeDutyValidationReferenceDataValidState extends ResumeDutyState {}

class ResumeDutyValidationPaymentMethodEmptyState extends ResumeDutyState {
  final String validationMassage;

  ResumeDutyValidationPaymentMethodEmptyState({
    required this.validationMassage,
  });
}

class ResumeDutyValidationPaymentMethodValidState extends ResumeDutyState {}

class ResumeDutyValidationActualResumeDutyDateEmptyState
    extends ResumeDutyState {
  final String validationMassage;

  ResumeDutyValidationActualResumeDutyDateEmptyState({
    required this.validationMassage,
  });
}

class ResumeDutyValidationActualResumeDutyDateValidState
    extends ResumeDutyState {}

class ResumeDutyValidationRemarksEmptyState extends ResumeDutyState {
  final String validationMassage;

  ResumeDutyValidationRemarksEmptyState({
    required this.validationMassage,
  });
}

class ResumeDutyValidationRemarksValidState extends ResumeDutyState {}

class ResumeDutyValidationFileEmptyState extends ResumeDutyState {
  final String validationMassage;

  ResumeDutyValidationFileEmptyState({
    required this.validationMassage,
  });
}

class ResumeDutyValidationFileValidState extends ResumeDutyState {}

class ResumeDutySubmitSuccessState extends ResumeDutyState {
  final String successMassage;

  ResumeDutySubmitSuccessState({
    required this.successMassage,
  });
}

class GetResumeDutyReferenceTypesSuccessState extends ResumeDutyState {
  final List<RequestType> requestTypes;

  GetResumeDutyReferenceTypesSuccessState({
    required this.requestTypes,
  });
}

class GetResumeDutyReferenceTypesErrorState extends ResumeDutyState {
  final String errorMassage;

  GetResumeDutyReferenceTypesErrorState({
    required this.errorMassage,
  });
}

class GetResumeDutyPaymentMethodSuccessState extends ResumeDutyState {
  final List<RequestPaymentMethod> paymentMethods;

  GetResumeDutyPaymentMethodSuccessState({
    required this.paymentMethods,
  });
}

class GetResumeDutyPaymentMethodsErrorState extends ResumeDutyState {
  final String errorMassage;

  GetResumeDutyPaymentMethodsErrorState({
    required this.errorMassage,
  });
}

class GetResumeDutyReferenceDataSuccessState extends ResumeDutyState {
  final List<RequestType> requestTypes;

  GetResumeDutyReferenceDataSuccessState({
    required this.requestTypes,
  });
}

class GetResumeDutyReferenceDataErrorState extends ResumeDutyState {
  final String errorMassage;

  GetResumeDutyReferenceDataErrorState({
    required this.errorMassage,
  });
}

class ResumeDutyShowPaymentMethodTextFieldState extends ResumeDutyState {
  final bool isVisiblePaymentMethod;

  ResumeDutyShowPaymentMethodTextFieldState(
      {required this.isVisiblePaymentMethod});
}
