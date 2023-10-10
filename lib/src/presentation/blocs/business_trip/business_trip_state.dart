part of 'business_trip_bloc.dart';

@immutable
abstract class BusinessTripState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class BusinessTripInitialState extends BusinessTripState {}

class BusinessTripLoadingState extends BusinessTripState {}

class BusinessTripBackState extends BusinessTripState {}

class BusinessTripOpenBusinessTripTypeBottomSheetState
    extends BusinessTripState {}

class BusinessTripSelectBusinessTripTypeState extends BusinessTripState {
  final RequestType requestType;

  BusinessTripSelectBusinessTripTypeState({
    required this.requestType,
  });
}

class BusinessTripOpenPaymentMethodBottomSheetState extends BusinessTripState {}

class BusinessTripSelectPaymentMethodState extends BusinessTripState {
  final RequestPaymentMethod paymentMethod;

  BusinessTripSelectPaymentMethodState({
    required this.paymentMethod,
  });
}

class BusinessTripValidationBusinessTripTypeEmptyState
    extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationBusinessTripTypeEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationBusinessTripTypeValidState
    extends BusinessTripState {}

class BusinessTripValidationDepartureDateEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationDepartureDateEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationDepartureDateValidState extends BusinessTripState {}

class BusinessTripValidationReturnDateEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationReturnDateEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationReturnDateValidState extends BusinessTripState {}

class BusinessTripValidationDurationEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationDurationEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationDurationValidState extends BusinessTripState {}

class BusinessTripValidationPaymentMethodEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationPaymentMethodEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationPaymentMethodValidState extends BusinessTripState {}

class BusinessTripValidationActualResumeDutyDateEmptyState
    extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationActualResumeDutyDateEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationActualResumeDutyDateValidState
    extends BusinessTripState {}

class BusinessTripValidationExpectedResumeDutyDateEmptyState
    extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationExpectedResumeDutyDateEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationExpectedResumeDutyDateValidState
    extends BusinessTripState {}

class BusinessTripValidationTripPurposeEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationTripPurposeEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationTripPurposeValidState extends BusinessTripState {}

class BusinessTripValidationFirstStepSuccessState extends BusinessTripState {}

class BusinessTripVisiblePaymentMethodState extends BusinessTripState {
  final bool paymentMethodVisible;

  BusinessTripVisiblePaymentMethodState({
    required this.paymentMethodVisible,
  });
}

class BusinessTripOpenCountryBottomSheetState extends BusinessTripState {}

class BusinessTripOpenCityBottomSheetState extends BusinessTripState {}

class BusinessTripOpenFileBottomSheetState extends BusinessTripState {}

class BusinessTripOpenCameraState extends BusinessTripState {}

class BusinessTripOpenGalleryState extends BusinessTripState {}

class BusinessTripOpenFileState extends BusinessTripState {}

class BusinessTripSelectFileState extends BusinessTripState {
  final String filePath;

  BusinessTripSelectFileState({
    required this.filePath,
  });
}

class BusinessTripDeleteFileState extends BusinessTripState {
  final String filePath;

  BusinessTripDeleteFileState({
    required this.filePath,
  });
}

class BusinessTripSelectCountryState extends BusinessTripState {
  final Country country;

  BusinessTripSelectCountryState({
    required this.country,
  });
}

class BusinessTripSelectCityState extends BusinessTripState {
  final City city;

  BusinessTripSelectCityState({
    required this.city,
  });
}

class BusinessTripValidationCountryEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationCountryEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationCountryValidState extends BusinessTripState {}

class BusinessTripValidationCityEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationCityEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationCityValidState extends BusinessTripState {}

class BusinessTripValidationFlightDateEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationFlightDateEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationFlightDateValidState extends BusinessTripState {}

class BusinessTripValidationVisaAmountEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationVisaAmountEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationVisaAmountValidState extends BusinessTripState {}

class BusinessTripValidationTicketAmountEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationTicketAmountEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationTicketAmountValidState extends BusinessTripState {}

class BusinessTripValidationHotelAmountEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationHotelAmountEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationHotelAmountValidState extends BusinessTripState {}

class BusinessTripValidationPerDiemAmountEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationPerDiemAmountEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationPerDiemAmountValidState extends BusinessTripState {}

class BusinessTripValidationRemarksEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationRemarksEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationRemarksValidState extends BusinessTripState {}

class BusinessTripValidationFileEmptyState extends BusinessTripState {
  final String validationMassage;

  BusinessTripValidationFileEmptyState({
    required this.validationMassage,
  });
}

class BusinessTripValidationFileValidState extends BusinessTripState {}

class BusinessTripStepState extends BusinessTripState{
  final int stepId;
  BusinessTripStepState({required this.stepId});
}

class BusinessTripVisaRequiredState extends BusinessTripState {
  final bool isSelectedVisaRequired;

  BusinessTripVisaRequiredState({required this.isSelectedVisaRequired});
}
