import 'package:talent_link/src/core/utils/validation/half_day_leave_validator.dart';
import 'package:talent_link/src/domain/entities/half_day_leave/half_day_leave.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_controller.dart';

class HalfDayLeaveValidationUseCase {
  List<HalfDayLeaveValidationState> validateFormUseCase({
    required String halfLeaveDate,
    required String startTime,
    required String endTime,
    required List<HalfDayLeave> halfDaysLeave,
    required String file,
    required HalfDayLeaveController halfDayLeaveController,
  }) {
    List<HalfDayLeaveValidationState> validations = List.empty(growable: true);
    HalfDayLeaveValidationState validation;

    for (var element in halfDaysLeave) {
      if (element.id == 3) {
        validation = validateFile(file.trim(), element.isMandatory);
        if (validation != HalfDayLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    for (var element in halfDaysLeave) {
      if (element.id == 2) {
        validation = validateLeaveReasons(
            halfDayLeaveController.leaveReasons.text.trim(),
            element.isMandatory);
        if (validation != HalfDayLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in halfDaysLeave) {
      if (element.id == 1) {
        validation = validateRemarks(
            halfDayLeaveController.remarks.text.trim(), element.isMandatory);
        if (validation != HalfDayLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    validation = validateNumberOfMinute(
        halfDayLeaveController.numberOfMinute.text.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateEndTime(endTime.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateStartTime(startTime.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateHalfLeaveDate(halfLeaveDate.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateHalfLeaveType(halfDayLeaveController.halfLeaveType.text.trim());
    if (validation != HalfDayLeaveValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  HalfDayLeaveValidationState validateNumberOfMinute(String numberOfMinute) {
    return HalfDayLeaveValidator.validateNumberOfMinute(
      numberOfMinute,
    );
  }

  HalfDayLeaveValidationState validateEndTime(String endTime) {
    return HalfDayLeaveValidator.validateEndTime(
      endTime,
    );
  }

  HalfDayLeaveValidationState validateStartTime(String startTime) {
    return HalfDayLeaveValidator.validateStartTime(
      startTime,
    );
  }

  HalfDayLeaveValidationState validateHalfLeaveDate(String halfLeaveDate) {
    return HalfDayLeaveValidator.validateHalfLeaveDate(
      halfLeaveDate,
    );
  }

  HalfDayLeaveValidationState validateHalfLeaveType(String halfLeaveType) {
    return HalfDayLeaveValidator.validateHalfLeaveType(
      halfLeaveType,
    );
  }

  HalfDayLeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    return HalfDayLeaveValidator.validateLeaveReasons(
        leaveReasons, isMandatory);
  }

  HalfDayLeaveValidationState validateRemarks(
      String remarks, bool isMandatory) {
    return HalfDayLeaveValidator.validateRemarks(remarks, isMandatory);
  }

  HalfDayLeaveValidationState validateFile(String file, bool isMandatory) {
    return HalfDayLeaveValidator.validateFile(file, isMandatory);
  }
}
