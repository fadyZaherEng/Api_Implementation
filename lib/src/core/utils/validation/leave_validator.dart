class LeaveValidator {
  static LeaveValidationState validateType(String type) {
    if (type.isEmpty) {
      return LeaveValidationState.typeEmpty;
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateStartDate(String startDate) {
    if (startDate.isEmpty) {
      return LeaveValidationState.startDateEmpty;
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateEndDate(String endDate) {
    if (endDate.isEmpty) {
      return LeaveValidationState.endDateEmpty;
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validatePaymentMethod(String paymentMethod ,bool isVisiblePaymentMethod) {
    if (isVisiblePaymentMethod) {
      if (paymentMethod.isEmpty) {
        return LeaveValidationState.paymentMethodEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    }else {
      return LeaveValidationState.valid;

    }

  }

  static LeaveValidationState validateExpectedResumingDate(
      String expectedResumingDate, bool isMandatory) {
    if (isMandatory == true) {
      if (expectedResumingDate.isEmpty) {
        return LeaveValidationState.expectedResumingDateEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateContactNumber(
      String contactNumber, bool isMandatory) {
    if (isMandatory == true) {
      if (contactNumber.isEmpty) {
        return LeaveValidationState.contactNumberEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateAddressDuringLeave(
      String addressDuringLeave, bool isMandatory) {
    if (isMandatory == true) {
      if (addressDuringLeave.isEmpty) {
        return LeaveValidationState.addressDuringLeaveEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateAlternativeEmployee(
      String alternativeEmployee, bool isMandatory) {
    if (isMandatory == true) {
      if (alternativeEmployee.isEmpty) {
        return LeaveValidationState.alternativeEmployeeEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateCurrantBalance(
      String currantBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (currantBalance.isEmpty) {
        return LeaveValidationState.currantBalanceEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (yearlyBalance.isEmpty) {
        return LeaveValidationState.yearlyBalanceEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (remainingBalance.isEmpty) {
        return LeaveValidationState.remainingBalanceEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateLeaveDays(
      String leaveDays, bool isMandatory) {
    if (isMandatory == true) {
      if (leaveDays.isEmpty) {
        return LeaveValidationState.leaveDaysEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateTotalAmount(
      String totalAmount, bool isMandatory) {
    if (isMandatory == true) {
      if (totalAmount.isEmpty) {
        return LeaveValidationState.totalAmountEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.isEmpty) {
        return LeaveValidationState.remarksEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    if (isMandatory == true) {
      if (leaveReasons.isEmpty) {
        return LeaveValidationState.leaveReasonsEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }

  static LeaveValidationState validateFile(String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.isEmpty) {
        return LeaveValidationState.fileEmpty;
      } else {
        return LeaveValidationState.valid;
      }
    } else {
      return LeaveValidationState.valid;
    }
  }
}

enum LeaveValidationState {
  typeEmpty,
  startDateEmpty,
  endDateEmpty,
  paymentMethodEmpty,
  expectedResumingDateEmpty,
  contactNumberEmpty,
  addressDuringLeaveEmpty,
  alternativeEmployeeEmpty,
  currantBalanceEmpty,
  yearlyBalanceEmpty,
  remainingBalanceEmpty,
  leaveDaysEmpty,
  totalAmountEmpty,
  leaveReasonsEmpty,
  remarksEmpty,
  fileEmpty,
  valid,
}
