import 'package:talent_link/src/core/utils/validation/short_leave_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/short_leave/short_leave.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';

class ShortLeaveValidationUseCase {
  List<ShortLeaveValidationState> validateFormUseCase(
      {required String date,
      required String startTime,
      required String endTime,
      required List<AllFieldsMandatory> allFieldsMandatory,
      required String file,
      required ShortLeaveController shortLeaveController}) {
    List<ShortLeaveValidationState> validations = List.empty(growable: true);
    ShortLeaveValidationState validation;
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 5) {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 4) {
        validation = validateRemarks(
            shortLeaveController.remarks.text.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 3) {
        validation = validateLeaveReasons(
            shortLeaveController.leaveReasons.text.trim(), element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 2) {
        validation = validateYearlyBalance(
            shortLeaveController.yearlyBalance.text.trim(),
            element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == 1) {
        validation = validateReferenceName(
            shortLeaveController.referenceName.text.trim(),
            element.isRequired);
        if (validation != ShortLeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    validation = validateEndNumberOfMinute(
        shortLeaveController.endNumberOfMinutes.text.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateEndTime(endTime.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateStartTime(startTime.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }
    validation = validateDate(date.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateType(shortLeaveController.type.text.trim());
    if (validation != ShortLeaveValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  ShortLeaveValidationState validateType(String type) {
    return ShortLeaveValidator.validateType(type);
  }

  ShortLeaveValidationState validateDate(String date) {
    return ShortLeaveValidator.validateDate(date);
  }

  ShortLeaveValidationState validateStartTime(String startTime) {
    return ShortLeaveValidator.validateStartTime(startTime);
  }

  ShortLeaveValidationState validateEndTime(String endTime) {
    return ShortLeaveValidator.validateEndTime(endTime);
  }

  ShortLeaveValidationState validateEndNumberOfMinute(
      String endNumberOfMinute) {
    return ShortLeaveValidator.validateEndNumberOfMinute(endNumberOfMinute);
  }

  ShortLeaveValidationState validateReferenceName(
      String referenceName, bool isMandatory) {
    return ShortLeaveValidator.validateReferenceName(
        referenceName, isMandatory);
  }

  ShortLeaveValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    return ShortLeaveValidator.validateYearlyBalance(
        yearlyBalance, isMandatory);
  }

  ShortLeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    return ShortLeaveValidator.validateLeaveReasons(leaveReasons, isMandatory);
  }

  ShortLeaveValidationState validateRemarks(String remarks, bool isMandatory) {
    return ShortLeaveValidator.validateRemarks(remarks, isMandatory);
  }

  ShortLeaveValidationState validateFile(String file, bool isMandatory) {
    return ShortLeaveValidator.validateFile(file, isMandatory);
  }
}
