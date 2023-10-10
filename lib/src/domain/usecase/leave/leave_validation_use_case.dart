import 'package:talent_link/src/core/utils/validation/leave_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_text_controller.dart';

class LeaveValidationUseCase {
  List<LeaveValidationState> validateFormUseCase({
    required String startDate,
    required String endDate,
    required List<AllFieldsMandatory> allFieldsMandatory,
    required String expectedResumingDate,
    required String file,
    required LeaveTextEditingController leaveTextEditingController,
    required bool isVisiblePaymentMethod,
  }) {
    List<LeaveValidationState> validations = List.empty(growable: true);
    LeaveValidationState validation;

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "employeeLeaveAttachments") {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remarks") {
        validation = validateRemarks(
            leaveTextEditingController.remarksController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "leaveReason") {
        validation = validateLeaveReasons(
            leaveTextEditingController.leaveReasonsController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "totalAmount") {
        validation = validateTotalAmount(
            leaveTextEditingController.totalAmountController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "leaveDays") {
        validation = validateLeaveDays(
            leaveTextEditingController.leaveDaysController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remainingBalance") {
        validation = validateRemainingBalance(
            leaveTextEditingController.remainingBalanceController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "yearlyBalance") {
        validation = validateYearlyBalance(
            leaveTextEditingController.yearlyBalanceController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "currentBalance") {
        validation = validateCurrantBalance(
            leaveTextEditingController.currentBalanceController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "alternativeEmployeeId") {
        validation = validateAlternativeEmployee(
            leaveTextEditingController.alternativeEmployeeController.text
                .trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "addressDuringLeave") {
        validation = validateAddressDuring(
            leaveTextEditingController.addressDuringLeaveController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "emergencyContactNo") {
        validation = validateContactNumber(
            leaveTextEditingController.contactNoController.text.trim(),
            element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "expectedResumeDuty") {
        validation = validateExpectedResumingDate(
            expectedResumingDate.trim(), element.isRequired);
        if (validation != LeaveValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    validation = validatePaymentMethod(
        leaveTextEditingController.paymentMethodController.text.trim(),
        isVisiblePaymentMethod);
    if (validation != LeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateEndDate(endDate.trim());
    if (validation != LeaveValidationState.valid) {
      validations.add(validation);
    }

    validation = validateStartDate(startDate.trim());
    if (validation != LeaveValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateType(leaveTextEditingController.typeController.text.trim());
    if (validation != LeaveValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  LeaveValidationState validateType(String type) {
    return LeaveValidator.validateType(
      type,
    );
  }

  LeaveValidationState validateStartDate(String startDate) {
    return LeaveValidator.validateStartDate(
      startDate,
    );
  }

  LeaveValidationState validateEndDate(String endDate) {
    return LeaveValidator.validateEndDate(
      endDate,
    );
  }

  LeaveValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    return LeaveValidator.validatePaymentMethod(
        paymentMethod, isVisiblePaymentMethod);
  }

  LeaveValidationState validateExpectedResumingDate(
      String expectedResumingDate, bool isMandatory) {
    return LeaveValidator.validateExpectedResumingDate(
        expectedResumingDate, isMandatory);
  }

  LeaveValidationState validateContactNumber(
      String contactNumber, bool isMandatory) {
    return LeaveValidator.validateContactNumber(contactNumber, isMandatory);
  }

  LeaveValidationState validateAddressDuring(
      String addressDuring, bool isMandatory) {
    return LeaveValidator.validateAddressDuringLeave(
        addressDuring, isMandatory);
  }

  LeaveValidationState validateAlternativeEmployee(
      String alternative, bool isMandatory) {
    return LeaveValidator.validateAlternativeEmployee(alternative, isMandatory);
  }

  LeaveValidationState validateCurrantBalance(
      String currentBalance, bool isMandatory) {
    return LeaveValidator.validateCurrantBalance(currentBalance, isMandatory);
  }

  LeaveValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    return LeaveValidator.validateYearlyBalance(yearlyBalance, isMandatory);
  }

  LeaveValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    return LeaveValidator.validateRemainingBalance(
        remainingBalance, isMandatory);
  }

  LeaveValidationState validateLeaveDays(String leaveDays, bool isMandatory) {
    return LeaveValidator.validateLeaveDays(leaveDays, isMandatory);
  }

  LeaveValidationState validateTotalAmount(
      String totalAmount, bool isMandatory) {
    return LeaveValidator.validateTotalAmount(totalAmount, isMandatory);
  }

  LeaveValidationState validateLeaveReasons(
      String leaveReasons, bool isMandatory) {
    return LeaveValidator.validateLeaveReasons(leaveReasons, isMandatory);
  }

  LeaveValidationState validateRemarks(String remarks, bool isMandatory) {
    return LeaveValidator.validateRemarks(remarks, isMandatory);
  }

  LeaveValidationState validateFile(String file, bool isMandatory) {
    return LeaveValidator.validateFile(file, isMandatory);
  }
}
