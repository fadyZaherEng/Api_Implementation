class LeaveEncashmentValidator {
  static LeaveEncashmentValidationState validateType(String type) {
    if (type.isEmpty) {
      return LeaveEncashmentValidationState.typeEmpty;
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateRequestDate(
      String requestDate) {
    if (requestDate.isEmpty) {
      return LeaveEncashmentValidationState.requestDateEmpty;
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateRequestDays(
      String requestDays,int maxDays) {
    if (requestDays.isEmpty) {
      return LeaveEncashmentValidationState.requestDaysEmpty;
    } else {
      if(int.parse(requestDays)<=maxDays &&int.parse(requestDays)>0){
        return LeaveEncashmentValidationState.valid;
      }else {
        return LeaveEncashmentValidationState.requestDaysNotValid;
      }

    }
  }

  static LeaveEncashmentValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    if (isVisiblePaymentMethod) {
      if (paymentMethod.isEmpty) {
        return LeaveEncashmentValidationState.paymentMethodEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    }else{
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateCurrentBalance(
      String currentBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (currentBalance.isEmpty) {
        return LeaveEncashmentValidationState.currentBalanceEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (yearlyBalance.isEmpty) {
        return LeaveEncashmentValidationState.yearlyBalanceEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (remainingBalance.isEmpty) {
        return LeaveEncashmentValidationState.remainingBalanceEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateTotalAmount(
      String totalAmount, bool isMandatory) {
    if (isMandatory == true) {
      if (totalAmount.isEmpty) {
        return LeaveEncashmentValidationState.totalAmountEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.isEmpty) {
        return LeaveEncashmentValidationState.remarksEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }

  static LeaveEncashmentValidationState validateFile(
      String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.isEmpty) {
        return LeaveEncashmentValidationState.fileEmpty;
      } else {
        return LeaveEncashmentValidationState.valid;
      }
    } else {
      return LeaveEncashmentValidationState.valid;
    }
  }
}

enum LeaveEncashmentValidationState {
  typeEmpty,
  requestDateEmpty,
  requestDaysEmpty,
  paymentMethodEmpty,
  currentBalanceEmpty,
  yearlyBalanceEmpty,
  remainingBalanceEmpty,
  totalAmountEmpty,
  remarksEmpty,
  fileEmpty,
  requestDaysNotValid,
  valid,
}
