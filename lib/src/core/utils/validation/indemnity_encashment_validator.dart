class IndemnityEncashmentValidator {
  static IndemnityEncashmentValidationState validateRequestDate(
      String requestDate) {
    if (requestDate.isEmpty) {
      return IndemnityEncashmentValidationState.requestDateEmpty;
    } else {
      return IndemnityEncashmentValidationState.valid;
    }
  }

  static IndemnityEncashmentValidationState validateRequestedDays(
      String requestDays) {
    if (requestDays.trim().isEmpty) {
      return IndemnityEncashmentValidationState.requestedDaysEmpty;
    } else {
      if (int.parse(requestDays.toString()) >= 81) {
        return IndemnityEncashmentValidationState.requestedDaysNotValid;
      } else {
        return IndemnityEncashmentValidationState.valid;
      }
    }
  }

  static IndemnityEncashmentValidationState validatePaymentMonth(
      String paymentMonth) {
    if (paymentMonth.isEmpty) {
      return IndemnityEncashmentValidationState.paymentMonthEmpty;
    } else {
      return IndemnityEncashmentValidationState.valid;
    }
  }

  static IndemnityEncashmentValidationState validatePaymentMethod(
      String paymentMethod) {
    if (paymentMethod.isEmpty) {
      return IndemnityEncashmentValidationState.paymentMethodEmpty;
    } else {
      return IndemnityEncashmentValidationState.valid;
    }
  }

  static IndemnityEncashmentValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.isEmpty) {
        return IndemnityEncashmentValidationState.remarksEmpty;
      } else {
        return IndemnityEncashmentValidationState.valid;
      }
    } else {
      return IndemnityEncashmentValidationState.valid;
    }
  }

  static IndemnityEncashmentValidationState validateFile(
      String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.isEmpty) {
        return IndemnityEncashmentValidationState.fileEmpty;
      } else {
        return IndemnityEncashmentValidationState.valid;
      }
    } else {
      return IndemnityEncashmentValidationState.valid;
    }
  }
}

enum IndemnityEncashmentValidationState {
  requestDateEmpty,
  requestedDaysEmpty,
  requestedDaysNotValid,
  paymentMonthEmpty,
  paymentMethodEmpty,
  remarksEmpty,
  fileEmpty,
  valid,
}
