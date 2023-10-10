import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/utils/validation/business_trip_validator.dart';
import 'package:talent_link/src/domain/entities/business_trip/city.dart';
import 'package:talent_link/src/domain/entities/business_trip/country.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/business_trip/business_trip_validation_use_case.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_controller.dart';

part 'business_trip_event.dart';

part 'business_trip_state.dart';

class BusinessTripBloc extends Bloc<BusinessTripEvent, BusinessTripState> {
  final BusinessTripValidationUseCase _businessTripValidationUseCase;

  BusinessTripBloc(this._businessTripValidationUseCase)
      : super(BusinessTripInitialState()) {
    on<BusinessTripBackEvent>(_onBusinessTripBackEvent);
    on<BusinessTripOpenBusinessTripTypeBottomSheetEvent>(
        _onBusinessTripOpenBusinessTripTypeBottomSheetEvent);
    on<BusinessTripSelectBusinessTripTypeEvent>(
        _onBusinessTripSelectBusinessTripTypeEvent);
    on<BusinessTripOpenPaymentMethodBottomSheetEvent>(
        _onBusinessTripOpenPaymentMethodBottomSheetEvent);
    on<BusinessTripSelectPaymentMethodEvent>(
        _onBusinessTripSelectPaymentMethodEvent);
    on<BusinessTripNextEvent>(_onBusinessTripNextEvent);
    on<BusinessTripValidationBusinessTripTypeEmptyEvent>(
        _onBusinessTripValidationBusinessTripTypeEmptyEvent);
    on<BusinessTripValidationDepartureDateEvent>(
        _onBusinessTripValidationDepartureDateEvent);
    on<BusinessTripValidationReturnDateEvent>(
        _onBusinessTripValidationReturnDateEvent);
    on<BusinessTripValidationDurationEvent>(
        _onBusinessTripValidationDurationEvent);
    on<BusinessTripValidationExpectedResumeDutyDateEvent>(
        _onBusinessTripValidationExpectedResumeDutyDateEvent);
    on<BusinessTripValidationPaymentMethodEvent>(
        _onBusinessTripValidationPaymentMethodEvent);
    on<BusinessTripValidationActualResumeDutyDateEvent>(
        _onBusinessTripValidationActualResumeDutyDateEvent);
    on<BusinessTripValidationTripPurposeEvent>(
        _onBusinessTripValidationTripPurposeEvent);
    on<BusinessTripVisiblePaymentMethodEvent>(
        _onBusinessTripVisiblePaymentMethodEvent);
    on<BusinessTripAddEvent>(_onBusinessTripAddEvent);
    on<BusinessTripOpenCountryBottomSheetEvent>(
        _onBusinessTripOpenCountryBottomSheetEvent);
    on<BusinessTripOpenCityBottomSheetEvent>(
        _onBusinessTripOpenCityBottomSheetEvent);
    on<BusinessTripOpenFileBottomSheetEvent>(
        _onBusinessTripOpenFileBottomSheetEvent);
    on<BusinessTripOpenCameraEvent>(_onBusinessTripOpenCameraEvent);
    on<BusinessTripOpenGalleryEvent>(_onBusinessTripOpenGalleryEvent);
    on<BusinessTripOpenFileEvent>(_onBusinessTripOpenFileEvent);
    on<BusinessTripSelectFileEvent>(_onBusinessTripSelectFileEvent);
    on<BusinessTripDeleteFileEvent>(_onBusinessTripDeleteFileEvent);
    on<BusinessTripSelectCountryEvent>(_onBusinessTripSelectCountryEvent);
    on<BusinessTripSelectCityEvent>(_onBusinessTripSelectCityEvent);
    on<BusinessTripValidationCountryEvent>(
        _onBusinessTripValidationCountryEvent);
    on<BusinessTripValidationCityEvent>(_onBusinessTripValidationCityEvent);
    on<BusinessTripValidationFlightDateEvent>(
        _onBusinessTripValidationFlightDateEvent);
    on<BusinessTripValidationVisaAmountEvent>(
        _onBusinessTripValidationVisaAmountEvent);
    on<BusinessTripValidationTicketAmountEvent>(
        _onBusinessTripValidationTicketAmountEvent);
    on<BusinessTripValidationHotelAmountEvent>(
        _onBusinessTripValidationHotelAmountEvent);
    on<BusinessTripValidationPerDiemAmountEvent>(
        _onBusinessTripValidationPerDiemAmountEvent);
    on<BusinessTripValidationRemarksEvent>(
        _onBusinessTripValidationRemarksEvent);
    on<BusinessTripValidationFileEvent>(_onBusinessTripValidationFileEvent);
    on<BusinessTripStepEvent>(_onBusinessTripStepEvent);
    on<BusinessTripVisaRequiredEvent>(_onBusinessTripVisaRequiredEvent);
  }

  List<RequestType> businessTripTypes = [
    RequestType(id: 1, name: "Business Trip Type 1"),
    RequestType(id: 2, name: "Business Trip Type 2"),
    RequestType(id: 3, name: "Business Trip Type 3"),
  ];
  final List<RequestPaymentMethod> paymentMethods = [
    RequestPaymentMethod(id: 1, name: "Payment Method 1"),
    RequestPaymentMethod(id: 2, name: "Payment Method 2"),
    RequestPaymentMethod(id: 3, name: "Payment Method 3"),
  ];
  final List<Country> countries = [
    Country(countryId: 1, countryName: "India"),
    Country(countryId: 2, countryName: "Kuwait"),
    Country(countryId: 3, countryName: "Egypt"),
  ];
  final List<City> cites = [
    City(countryId: 1, cityId: 1, cityName: "city 2"),
    City(countryId: 1, cityId: 2, cityName: "city 2"),
    City(countryId: 1, cityId: 3, cityName: "city 3"),
  ];

  FutureOr<void> _onBusinessTripBackEvent(
      BusinessTripBackEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripBackState());
  }

  FutureOr<void> _onBusinessTripOpenBusinessTripTypeBottomSheetEvent(
      BusinessTripOpenBusinessTripTypeBottomSheetEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenBusinessTripTypeBottomSheetState());
  }

  FutureOr<void> _onBusinessTripSelectBusinessTripTypeEvent(
      BusinessTripSelectBusinessTripTypeEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripSelectBusinessTripTypeState(
        requestType: event.requestType));

    add(BusinessTripValidationBusinessTripTypeEmptyEvent(
        value: event.requestType.name));
  }

  FutureOr<void> _onBusinessTripOpenPaymentMethodBottomSheetEvent(
      BusinessTripOpenPaymentMethodBottomSheetEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onBusinessTripSelectPaymentMethodEvent(
      BusinessTripSelectPaymentMethodEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripSelectPaymentMethodState(
        paymentMethod: event.paymentMethod));
    add(BusinessTripValidationPaymentMethodEvent(
        value: event.paymentMethod.name, paymentVisible: event.paymentVisible));
  }

  FutureOr<void> _onBusinessTripNextEvent(
      BusinessTripNextEvent event, Emitter<BusinessTripState> emit) {
    final validationsState =
        _businessTripValidationUseCase.validateBusinessTripFormUseCase(
            businessTripController: event.businessTripController,
            paymentVisible: event.paymentVisible);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == BusinessTripValidationState.businessTripTypeEmpty) {
          emit(BusinessTripValidationBusinessTripTypeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.departureDateEmpty) {
          emit(BusinessTripValidationDepartureDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.returnDateEmpty) {
          emit(BusinessTripValidationReturnDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.durationEmpty) {
          emit(BusinessTripValidationDurationEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            BusinessTripValidationState.expectedResumeDutyDateEmpty) {
          emit(BusinessTripValidationExpectedResumeDutyDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.paymentMethodEmpty) {
          emit(BusinessTripValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            BusinessTripValidationState.actualResumeDutyDateEmpty) {
          emit(BusinessTripValidationActualResumeDutyDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.tripPurposeEmpty) {
          emit(BusinessTripValidationTripPurposeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(BusinessTripValidationFirstStepSuccessState());
    }
  }

  FutureOr<void> _onBusinessTripValidationBusinessTripTypeEmptyEvent(
      BusinessTripValidationBusinessTripTypeEmptyEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateBusinessTripType(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationBusinessTripTypeValidState());
    } else {
      emit(BusinessTripValidationBusinessTripTypeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationDepartureDateEvent(
      BusinessTripValidationDepartureDateEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateDepartureDate(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationDepartureDateValidState());
    } else {
      emit(BusinessTripValidationDepartureDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationReturnDateEvent(
      BusinessTripValidationReturnDateEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateReturnDate(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationReturnDateValidState());
    } else {
      emit(BusinessTripValidationReturnDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationDurationEvent(
      BusinessTripValidationDurationEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateDuration(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationDurationValidState());
    } else {
      emit(BusinessTripValidationDurationEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationExpectedResumeDutyDateEvent(
      BusinessTripValidationExpectedResumeDutyDateEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase
            .validateExpectedResumeDutyDate(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationExpectedResumeDutyDateValidState());
    } else {
      emit(BusinessTripValidationExpectedResumeDutyDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationPaymentMethodEvent(
      BusinessTripValidationPaymentMethodEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validatePaymentMethod(
            event.value, event.paymentVisible);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationPaymentMethodValidState());
    } else {
      emit(BusinessTripValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationActualResumeDutyDateEvent(
      BusinessTripValidationActualResumeDutyDateEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase
            .validateActualResumeDutyDate(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationActualResumeDutyDateValidState());
    } else {
      emit(BusinessTripValidationActualResumeDutyDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationTripPurposeEvent(
      BusinessTripValidationTripPurposeEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateTripPurpose(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationTripPurposeValidState());
    } else {
      emit(BusinessTripValidationTripPurposeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripVisiblePaymentMethodEvent(
      BusinessTripVisiblePaymentMethodEvent event,
      Emitter<BusinessTripState> emit) {
    if (event.singleSelectionModel.id == 1) {
      emit(BusinessTripVisiblePaymentMethodState(paymentMethodVisible: false));
    } else {
      emit(BusinessTripVisiblePaymentMethodState(paymentMethodVisible: true));
    }
  }

  FutureOr<void> _onBusinessTripAddEvent(
      BusinessTripAddEvent event, Emitter<BusinessTripState> emit) {
    final validationsState =
        _businessTripValidationUseCase.validateDestinationFormUseCase(
            businessTripController: event.businessTripController,
            file: event.file);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == BusinessTripValidationState.countryEmpty) {
          emit(BusinessTripValidationCountryEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.cityEmpty) {
          emit(BusinessTripValidationCityEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.flightDateEmpty) {
          emit(BusinessTripValidationFlightDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.visaAmountEmpty) {
          emit(BusinessTripValidationVisaAmountEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.ticketAmountEmpty) {
          emit(BusinessTripValidationTicketAmountEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.hotelAmountEmpty) {
          emit(BusinessTripValidationHotelAmountEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.perDiemAmountEmpty) {
          emit(BusinessTripValidationPerDiemAmountEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.remarksEmpty) {
          emit(BusinessTripValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == BusinessTripValidationState.fileEmpty) {
          emit(BusinessTripValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {}
  }

  FutureOr<void> _onBusinessTripOpenCountryBottomSheetEvent(
      BusinessTripOpenCountryBottomSheetEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenCountryBottomSheetState());
  }

  FutureOr<void> _onBusinessTripOpenCityBottomSheetEvent(
      BusinessTripOpenCityBottomSheetEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenCityBottomSheetState());
  }

  FutureOr<void> _onBusinessTripOpenFileBottomSheetEvent(
      BusinessTripOpenFileBottomSheetEvent event,
      Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenFileBottomSheetState());
  }

  FutureOr<void> _onBusinessTripOpenCameraEvent(
      BusinessTripOpenCameraEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenCameraState());
  }

  FutureOr<void> _onBusinessTripOpenGalleryEvent(
      BusinessTripOpenGalleryEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenGalleryState());
  }

  FutureOr<void> _onBusinessTripOpenFileEvent(
      BusinessTripOpenFileEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripOpenFileState());
  }

  FutureOr<void> _onBusinessTripSelectFileEvent(
      BusinessTripSelectFileEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripSelectFileState(filePath: event.filePath));

    add(BusinessTripValidationFileEvent(value: event.filePath));
  }

  FutureOr<void> _onBusinessTripDeleteFileEvent(
      BusinessTripDeleteFileEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripDeleteFileState(filePath: ''));
    add(BusinessTripValidationFileEvent(value: ''));
  }

  FutureOr<void> _onBusinessTripSelectCountryEvent(
      BusinessTripSelectCountryEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripSelectCountryState(country: event.country));
    add(BusinessTripValidationCountryEvent(value: event.country.countryName));
  }

  FutureOr<void> _onBusinessTripSelectCityEvent(
      BusinessTripSelectCityEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripSelectCityState(city: event.city));
    add(BusinessTripValidationCityEvent(value: event.city.cityName));
  }

  FutureOr<void> _onBusinessTripValidationCountryEvent(
      BusinessTripValidationCountryEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateCountry(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationCountryValidState());
    } else {
      emit(BusinessTripValidationCountryEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationCityEvent(
      BusinessTripValidationCityEvent event, Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateCity(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationCityValidState());
    } else {
      emit(BusinessTripValidationCityEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationFlightDateEvent(
      BusinessTripValidationFlightDateEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateFlightDate(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationFlightDateValidState());
    } else {
      emit(BusinessTripValidationFlightDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationVisaAmountEvent(
      BusinessTripValidationVisaAmountEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateVisaAmount(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationVisaAmountValidState());
    } else {
      emit(BusinessTripValidationVisaAmountEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationTicketAmountEvent(
      BusinessTripValidationTicketAmountEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateTicketAmount(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationTicketAmountValidState());
    } else {
      emit(BusinessTripValidationTicketAmountEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationHotelAmountEvent(
      BusinessTripValidationHotelAmountEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateHotelAmount(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationHotelAmountValidState());
    } else {
      emit(BusinessTripValidationHotelAmountEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationPerDiemAmountEvent(
      BusinessTripValidationPerDiemAmountEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validatePerDiemAmount(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationPerDiemAmountValidState());
    } else {
      emit(BusinessTripValidationPerDiemAmountEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationRemarksEvent(
      BusinessTripValidationRemarksEvent event,
      Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateRemarks(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationRemarksValidState());
    } else {
      emit(BusinessTripValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripValidationFileEvent(
      BusinessTripValidationFileEvent event, Emitter<BusinessTripState> emit) {
    BusinessTripValidationState businessTripValidationState =
        _businessTripValidationUseCase.validateFile(event.value);
    if (businessTripValidationState == BusinessTripValidationState.valid) {
      emit(BusinessTripValidationFileValidState());
    } else {
      emit(BusinessTripValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onBusinessTripStepEvent(
      BusinessTripStepEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripStepState(stepId: event.stepId));
  }

  FutureOr<void> _onBusinessTripVisaRequiredEvent(
      BusinessTripVisaRequiredEvent event, Emitter<BusinessTripState> emit) {
    emit(BusinessTripVisaRequiredState(
        isSelectedVisaRequired: !event.isSelectedVisaRequired));
  }
}
