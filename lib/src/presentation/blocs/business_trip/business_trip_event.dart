part of 'business_trip_bloc.dart';

@immutable
abstract class BusinessTripEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class BusinessTripBackEvent extends BusinessTripEvent {}

class BusinessTripOpenBusinessTripTypeBottomSheetEvent
    extends BusinessTripEvent {}

class BusinessTripSelectBusinessTripTypeEvent extends BusinessTripEvent {
  final RequestType requestType;

  BusinessTripSelectBusinessTripTypeEvent({
    required this.requestType,
  });
}

class BusinessTripOpenPaymentMethodBottomSheetEvent extends BusinessTripEvent {}

class BusinessTripSelectPaymentMethodEvent extends BusinessTripEvent {
  final RequestPaymentMethod paymentMethod;
  final bool paymentVisible;

  BusinessTripSelectPaymentMethodEvent({
    required this.paymentMethod,
    required this.paymentVisible,
  });
}

class BusinessTripNextEvent extends BusinessTripEvent {
  final BusinessTripController businessTripController;
  final bool paymentVisible;

  BusinessTripNextEvent({
    required this.businessTripController,
    required this.paymentVisible,
  });
}

class BusinessTripValidationBusinessTripTypeEmptyEvent
    extends BusinessTripEvent {
  final String value;

  BusinessTripValidationBusinessTripTypeEmptyEvent({
    required this.value,
  });
}

class BusinessTripValidationDepartureDateEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationDepartureDateEvent({
    required this.value,
  });
}

class BusinessTripValidationReturnDateEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationReturnDateEvent({
    required this.value,
  });
}

class BusinessTripValidationDurationEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationDurationEvent({
    required this.value,
  });
}

class BusinessTripValidationExpectedResumeDutyDateEvent
    extends BusinessTripEvent {
  final String value;

  BusinessTripValidationExpectedResumeDutyDateEvent({
    required this.value,
  });
}

class BusinessTripValidationPaymentMethodEvent extends BusinessTripEvent {
  final String value;
  final bool paymentVisible;

  BusinessTripValidationPaymentMethodEvent({
    required this.value,
    required this.paymentVisible,
  });
}

class BusinessTripValidationActualResumeDutyDateEvent
    extends BusinessTripEvent {
  final String value;

  BusinessTripValidationActualResumeDutyDateEvent({
    required this.value,
  });
}

class BusinessTripValidationTripPurposeEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationTripPurposeEvent({
    required this.value,
  });
}

class BusinessTripVisiblePaymentMethodEvent extends BusinessTripEvent {
  final SingleSelectionModel singleSelectionModel;

  BusinessTripVisiblePaymentMethodEvent({
    required this.singleSelectionModel,
  });
}

class BusinessTripAddEvent extends BusinessTripEvent {
  final BusinessTripController businessTripController;
  final String file;

  BusinessTripAddEvent({
    required this.businessTripController,
    required this.file,
  });
}

class BusinessTripOpenCountryBottomSheetEvent extends BusinessTripEvent {}

class BusinessTripOpenCityBottomSheetEvent extends BusinessTripEvent {}

class BusinessTripOpenFileBottomSheetEvent extends BusinessTripEvent {}

class BusinessTripOpenCameraEvent extends BusinessTripEvent {}

class BusinessTripOpenGalleryEvent extends BusinessTripEvent {}

class BusinessTripOpenFileEvent extends BusinessTripEvent {}

class BusinessTripSelectFileEvent extends BusinessTripEvent {
  final String filePath;

  BusinessTripSelectFileEvent({
    required this.filePath,
  });
}

class BusinessTripDeleteFileEvent extends BusinessTripEvent {
  final String filePath;

  BusinessTripDeleteFileEvent({
    required this.filePath,
  });
}

class BusinessTripSelectCountryEvent extends BusinessTripEvent {
  final Country country;

  BusinessTripSelectCountryEvent({
    required this.country,
  });
}

class BusinessTripSelectCityEvent extends BusinessTripEvent {
  final City city;

  BusinessTripSelectCityEvent({
    required this.city,
  });
}

class BusinessTripValidationCountryEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationCountryEvent({required this.value});
}

class BusinessTripValidationCityEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationCityEvent({required this.value});
}

class BusinessTripValidationFlightDateEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationFlightDateEvent({required this.value});
}

class BusinessTripValidationVisaAmountEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationVisaAmountEvent({required this.value});
}

class BusinessTripValidationTicketAmountEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationTicketAmountEvent({required this.value});
}

class BusinessTripValidationHotelAmountEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationHotelAmountEvent({required this.value});
}

class BusinessTripValidationPerDiemAmountEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationPerDiemAmountEvent({required this.value});
}

class BusinessTripValidationRemarksEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationRemarksEvent({required this.value});
}

class BusinessTripValidationFileEvent extends BusinessTripEvent {
  final String value;

  BusinessTripValidationFileEvent({required this.value});
}

class BusinessTripStepEvent extends BusinessTripEvent {
  final int stepId;

  BusinessTripStepEvent({required this.stepId});
}

class BusinessTripVisaRequiredEvent extends BusinessTripEvent {
  final bool isSelectedVisaRequired;

  BusinessTripVisaRequiredEvent({required this.isSelectedVisaRequired});
}
