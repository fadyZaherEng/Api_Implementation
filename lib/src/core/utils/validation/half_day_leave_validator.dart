class HalfDayLeaveValidator {
  static HalfDayLeaveValidationState validateHalfLeaveType(
      String halfLeaveType) {
    if (halfLeaveType.isEmpty) {
      return HalfDayLeaveValidationState.halfLeaveTypeEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateHalfLeaveDate(
      String halfLeaveDate) {
    if (halfLeaveDate.isEmpty) {
      return HalfDayLeaveValidationState.halfLeaveDateEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateStartTime(String startTime) {
    if (startTime.isEmpty) {
      return HalfDayLeaveValidationState.startTimeEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateEndTime(String endTime) {
    if (endTime.isEmpty) {
      return HalfDayLeaveValidationState.endTimeEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateNumberOfMinute(
      String numberOfMinute) {
    if (numberOfMinute.isEmpty) {
      return HalfDayLeaveValidationState.numberOfMinuteEmpty;
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateLeaveReasons(
      String reasons, bool isMandatory) {
    if (isMandatory == true) {
      if (reasons.isEmpty) {
        return HalfDayLeaveValidationState.leaveReasonsEmpty;
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.isEmpty) {
        return HalfDayLeaveValidationState.leaveRemarksEmpty;
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }

  static HalfDayLeaveValidationState validateFile(
      String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.isEmpty) {
        return HalfDayLeaveValidationState.fileEmpty;
      } else {
        return HalfDayLeaveValidationState.valid;
      }
    } else {
      return HalfDayLeaveValidationState.valid;
    }
  }
}

enum HalfDayLeaveValidationState {
  halfLeaveTypeEmpty,
  halfLeaveDateEmpty,
  startTimeEmpty,
  endTimeEmpty,
  numberOfMinuteEmpty,
  leaveRemarksEmpty,
  leaveReasonsEmpty,
  fileEmpty,
  valid,
}
