class BusinessTripValidator {
  static BusinessTripValidationState validateBusinessTripType(
      String businessTripType) {
    if (businessTripType.isEmpty) {
      return BusinessTripValidationState.businessTripTypeEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateDepartureDate(
      String departureDate) {
    if (departureDate.isEmpty) {
      return BusinessTripValidationState.departureDateEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateReturnDate(String returnDate) {
    if (returnDate.isEmpty) {
      return BusinessTripValidationState.returnDateEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateDuration(String duration) {
    if (duration.isEmpty) {
      return BusinessTripValidationState.durationEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateExpectedResumeDutyDate(
      String expectedResumeDutyDate) {
    if (expectedResumeDutyDate.isEmpty) {
      return BusinessTripValidationState.expectedResumeDutyDateEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validatePaymentMethod(
      String paymentMethod,bool paymentVisible) {
    if (paymentMethod.isEmpty && paymentVisible) {
      return BusinessTripValidationState.paymentMethodEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateActualResumeDutyDate(
      String actualResumeDutyDate) {
    if (actualResumeDutyDate.isEmpty) {
      return BusinessTripValidationState.actualResumeDutyDateEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateTripPurpose(String tripPurpose) {
    if (tripPurpose.isEmpty) {
      return BusinessTripValidationState.tripPurposeEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateCountry(String country) {
    if (country.isEmpty) {
      return BusinessTripValidationState.countryEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateCity(String city) {
    if (city.isEmpty) {
      return BusinessTripValidationState.cityEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateFlightDate(String flightDate) {
    if (flightDate.isEmpty) {
      return BusinessTripValidationState.flightDateEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateVisaAmount(String visaAmount) {
    if (visaAmount.isEmpty) {
      return BusinessTripValidationState.visaAmountEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateTicketAmount(String ticketAmount) {
    if (ticketAmount.isEmpty) {
      return BusinessTripValidationState.ticketAmountEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateHotelAmount(String hotelAmount) {
    if (hotelAmount.isEmpty) {
      return BusinessTripValidationState.hotelAmountEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validatePerDiemAmount(
      String perDiemAmount) {
    if (perDiemAmount.isEmpty) {
      return BusinessTripValidationState.perDiemAmountEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateRemarks(String remarks) {
    if (remarks.isEmpty) {
      return BusinessTripValidationState.remarksEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }

  static BusinessTripValidationState validateFile(String file) {
    if (file.isEmpty) {
      return BusinessTripValidationState.fileEmpty;
    } else {
      return BusinessTripValidationState.valid;
    }
  }
}

enum BusinessTripValidationState {
  businessTripTypeEmpty,
  departureDateEmpty,
  returnDateEmpty,
  durationEmpty,
  expectedResumeDutyDateEmpty,
  paymentMethodEmpty,
  actualResumeDutyDateEmpty,
  tripPurposeEmpty,
  countryEmpty,
  cityEmpty,
  flightDateEmpty,
  visaAmountEmpty,
  ticketAmountEmpty,
  hotelAmountEmpty,
  perDiemAmountEmpty,
  remarksEmpty,
  fileEmpty,
  valid,
}
