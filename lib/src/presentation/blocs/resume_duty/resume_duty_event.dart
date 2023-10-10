part of 'resume_duty_bloc.dart';

@immutable
abstract class ResumeDutyEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ResumeDutyBackEvent extends ResumeDutyEvent {}

class ResumeDutyOpenReferenceTypeBottomSheetEvent extends ResumeDutyEvent {}

class ResumeDutyOpenReferenceDataBottomSheetEvent extends ResumeDutyEvent {}

class ResumeDutyOpenPaymentMethodBottomSheetEvent extends ResumeDutyEvent {}

class ResumeDutySelectReferenceTypeEvent extends ResumeDutyEvent {
  final RequestType requestType;

  ResumeDutySelectReferenceTypeEvent({
    required this.requestType,
  });
}

class ResumeDutySelectReferenceDataEvent extends ResumeDutyEvent {
  final RequestType requestType;

  ResumeDutySelectReferenceDataEvent({
    required this.requestType,
  });
}

class ResumeDutySelectPaymentMethodEvent extends ResumeDutyEvent {
  final RequestPaymentMethod requestType;
  final bool isVisiblePaymentMethod;

  ResumeDutySelectPaymentMethodEvent({
    required this.requestType,
    required this.isVisiblePaymentMethod,
  });
}

class ResumeDutyOpenUploadFileBottomSheetEvent extends ResumeDutyEvent {
  final bool isMandatory;

  ResumeDutyOpenUploadFileBottomSheetEvent({
    required this.isMandatory,
  });
}

class ResumeDutyOpenCameraEvent extends ResumeDutyEvent {
  final bool isMandatory;

  ResumeDutyOpenCameraEvent({
    required this.isMandatory,
  });
}

class ResumeDutyOpenGalleryEvent extends ResumeDutyEvent {
  final bool isMandatory;

  ResumeDutyOpenGalleryEvent({
    required this.isMandatory,
  });
}

class ResumeDutyOpenFileEvent extends ResumeDutyEvent {
  final bool isMandatory;

  ResumeDutyOpenFileEvent({
    required this.isMandatory,
  });
}

class ResumeDutySelectFileEvent extends ResumeDutyEvent {
  final String filePath;
  final bool isMandatory;

  ResumeDutySelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ResumeDutyDeleteFileEvent extends ResumeDutyEvent {
  final String filePath;
  final bool isMandatory;

  ResumeDutyDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ResumeDutyValidationReferenceTypeEvent extends ResumeDutyEvent {
  final String value;

  ResumeDutyValidationReferenceTypeEvent({
    required this.value,
  });
}

class ResumeDutyValidationReferenceDataEvent extends ResumeDutyEvent {
  final String value;

  ResumeDutyValidationReferenceDataEvent({
    required this.value,
  });
}

class ResumeDutyValidationPaymentMethodEvent extends ResumeDutyEvent {
  final String value;
  final bool isVisiblePaymentMethod;

  ResumeDutyValidationPaymentMethodEvent(
      {required this.value, required this.isVisiblePaymentMethod});
}

class ResumeDutyValidationActualResumeDutyDateEvent extends ResumeDutyEvent {
  final String value;

  ResumeDutyValidationActualResumeDutyDateEvent({
    required this.value,
  });
}

class ResumeDutyValidationRemarksEvent extends ResumeDutyEvent {
  final String value;
  final bool isMandatory;

  ResumeDutyValidationRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ResumeDutyValidationFileEvent extends ResumeDutyEvent {
  final String value;
  final bool isMandatory;

  ResumeDutyValidationFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ResumeDutySubmitEvent extends ResumeDutyEvent {
  final List<ResumeDuty> resumeDuties;
  final String file;
  final String actualResumeDutyData;
  final ResumeDutyController resumeDutyController;
  final bool isVisiblePaymentMethod;

  ResumeDutySubmitEvent({
    required this.actualResumeDutyData,
    required this.resumeDutyController,
    required this.resumeDuties,
    required this.file,
    required this.isVisiblePaymentMethod,
  });
}

class GetResumeDutyReferenceTypesEvent extends ResumeDutyEvent {}

class GetResumeDutyPaymentMethodEvent extends ResumeDutyEvent {}

class GetResumeDutyReferenceDataEvent extends ResumeDutyEvent {
  final int resumeDutyReferenceType;
  final int isByPayroll;

  GetResumeDutyReferenceDataEvent({
    required this.isByPayroll,
    required this.resumeDutyReferenceType,
  });
}

class ResumeDutyShowPaymentMethodTextFieldEvent extends ResumeDutyEvent {
  final SingleSelectionModel selectionModel;

  ResumeDutyShowPaymentMethodTextFieldEvent({required this.selectionModel});
}
