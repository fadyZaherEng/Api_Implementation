import 'package:talent_link/src/core/utils/validation/business_trip_validator.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_controller.dart';

class BusinessTripValidationUseCase {
  List<BusinessTripValidationState> validateBusinessTripFormUseCase({
    required BusinessTripController businessTripController,
    required bool paymentVisible
  }) {
    List<BusinessTripValidationState> validations = List.empty(growable: true);
    BusinessTripValidationState validation;

    validation =
        validateTripPurpose(businessTripController.tripPurpose.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateActualResumeDutyDate(businessTripController.actualResumeDutyDate.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation =
        validatePaymentMethod(businessTripController.paymentMethod.text.trim(),paymentVisible);
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateExpectedResumeDutyDate(businessTripController.expectedResumeDutyDate.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateDuration(businessTripController.duration.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateReturnDate(businessTripController.returnDate.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateDepartureDate(businessTripController.departureDate.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateBusinessTripType(
        businessTripController.businessTripType.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  List<BusinessTripValidationState> validateDestinationFormUseCase({
    required BusinessTripController businessTripController,
    required String file,
  }) {
    List<BusinessTripValidationState> validations = List.empty(growable: true);
    BusinessTripValidationState validation;
    validation = validateFile(file.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRemarks(businessTripController.remarks.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validatePerDiemAmount(businessTripController.perDiemAmount.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation =
        validateHotelAmount(businessTripController.hotelAmount.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateTicketAmount(businessTripController.ticketAmount.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation =
        validateVisaAmount(businessTripController.visaAmount.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateFlightDate(businessTripController.flightDate.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateCity(businessTripController.city.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }
    validation = validateCountry(businessTripController.country.text.trim());
    if (validation != BusinessTripValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  BusinessTripValidationState validateBusinessTripType(
      String businessTripType) {
    return BusinessTripValidator.validateBusinessTripType(
      businessTripType,
    );
  }

  BusinessTripValidationState validateDepartureDate(String departureDate) {
    return BusinessTripValidator.validateDepartureDate(
      departureDate,
    );
  }

  BusinessTripValidationState validateReturnDate(String returnDate) {
    return BusinessTripValidator.validateReturnDate(
      returnDate,
    );
  }

  BusinessTripValidationState validateDuration(String duration) {
    return BusinessTripValidator.validateDuration(
      duration,
    );
  }

  BusinessTripValidationState validateExpectedResumeDutyDate(
      String expectedResumeDutyDate) {
    return BusinessTripValidator.validateExpectedResumeDutyDate(
      expectedResumeDutyDate,
    );
  }

  BusinessTripValidationState validatePaymentMethod(String paymentMethod,bool paymentVisible) {
    return BusinessTripValidator.validatePaymentMethod(
      paymentMethod,
        paymentVisible,
    );
  }

  BusinessTripValidationState validateActualResumeDutyDate(
      String actualResumeDutyDate) {
    return BusinessTripValidator.validateActualResumeDutyDate(
      actualResumeDutyDate,
    );
  }

  BusinessTripValidationState validateTripPurpose(String tripPurpose) {
    return BusinessTripValidator.validateTripPurpose(
      tripPurpose,
    );
  }

  BusinessTripValidationState validateCountry(String country) {
    return BusinessTripValidator.validateCountry(
      country,
    );
  }

  BusinessTripValidationState validateCity(String city) {
    return BusinessTripValidator.validateCity(
      city,
    );
  }

  BusinessTripValidationState validateFlightDate(String flightDate) {
    return BusinessTripValidator.validateFlightDate(
      flightDate,
    );
  }

  BusinessTripValidationState validateVisaAmount(String visaAmount) {
    return BusinessTripValidator.validateVisaAmount(
      visaAmount,
    );
  }

  BusinessTripValidationState validateTicketAmount(String ticketAmount) {
    return BusinessTripValidator.validateTicketAmount(
      ticketAmount,
    );
  }

  BusinessTripValidationState validateHotelAmount(String hotelAmount) {
    return BusinessTripValidator.validateHotelAmount(
      hotelAmount,
    );
  }

  BusinessTripValidationState validatePerDiemAmount(String perDiemAmount) {
    return BusinessTripValidator.validatePerDiemAmount(
      perDiemAmount,
    );
  }

  BusinessTripValidationState validateRemarks(String remarks) {
    return BusinessTripValidator.validateRemarks(
      remarks,
    );
  }

  BusinessTripValidationState validateFile(String file) {
    return BusinessTripValidator.validateFile(
      file,
    );
  }
}
