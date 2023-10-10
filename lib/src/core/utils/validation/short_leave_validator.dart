class ShortLeaveValidator {
  static ShortLeaveValidationState validateType(String type) {
    if (type.isEmpty) {
      return ShortLeaveValidationState.typeEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateDate(String date) {
    if (date.isEmpty) {
      return ShortLeaveValidationState.dateEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateStartTime(String startTime) {
    if (startTime.isEmpty) {
      return ShortLeaveValidationState.startTimeEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateEndTime(String endTime) {
    if (endTime.isEmpty) {
      return ShortLeaveValidationState.endTimeEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateEndNumberOfMinute(
      String endNumberOfMinute) {
    if (endNumberOfMinute.isEmpty) {
      return ShortLeaveValidationState.endNumberOfMinuteEmpty;
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateReferenceName(
      String referenceName, bool isMandatory) {
    if (isMandatory == true) {
      if (referenceName.isEmpty) {
        return ShortLeaveValidationState.referenceNameEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    if (isMandatory == true) {
      if (yearlyBalance.isEmpty) {
        return ShortLeaveValidationState.yearlyBalanceEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    if (isMandatory == true) {
      if (leaveReasons.isEmpty) {
        return ShortLeaveValidationState.leaveReasonsEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.isEmpty) {
        return ShortLeaveValidationState.remarksEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }

  static ShortLeaveValidationState validateFile(String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.isEmpty) {
        return ShortLeaveValidationState.fileEmpty;
      } else {
        return ShortLeaveValidationState.valid;
      }
    } else {
      return ShortLeaveValidationState.valid;
    }
  }
}

enum ShortLeaveValidationState {
  typeEmpty,
  dateEmpty,
  startTimeEmpty,
  endTimeEmpty,
  endNumberOfMinuteEmpty,
  referenceNameEmpty,
  yearlyBalanceEmpty,
  leaveReasonsEmpty,
  remarksEmpty,
  fileEmpty,
  valid,
}
