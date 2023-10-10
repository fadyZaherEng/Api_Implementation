import 'package:talent_link/src/core/utils/validation/leave_encashment_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_controller.dart';

class LeaveEncashmentValidationUseCase {
  List<LeaveEncashmentValidationState> validateFormUseCase({
    required String requestDate,
    required List<AllFieldsMandatory> allFieldsMandatory,
    required String file,
    required LeaveEncashmentController leaveEncashmentController,
    required bool isVisiblePaymentMethod,
    required int maxDays,
  }) {
    List<LeaveEncashmentValidationState> validations =
        List.empty(growable: true);
    LeaveEncashmentValidationState validation;

    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "") {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != LeaveEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remarks") {
        validation = validateRemarks(
            leaveEncashmentController.remarks.text.trim(), element.isRequired);
        if (validation != LeaveEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "TotalAmount") {
        validation = validateTotalAmount(
            leaveEncashmentController.totalAmount.text.trim(),
            element.isRequired);
        if (validation != LeaveEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "RemainingBalance") {
        validation = validateRemainingBalance(
            leaveEncashmentController.remainingBalance.text.trim(),
            element.isRequired);
        if (validation != LeaveEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "YearlyBalance") {
        validation = validateYearlyBalance(
            leaveEncashmentController.yearlyBalance.text.trim(),
            element.isRequired);
        if (validation != LeaveEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "CurrentBalance") {
        validation = validateCurrentBalance(
            leaveEncashmentController.currentBalance.text.trim(),
            element.isRequired);
        if (validation != LeaveEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    validation = validatePaymentMethod(
        leaveEncashmentController.paymentMethod.text.trim(),
        isVisiblePaymentMethod);
    if (validation != LeaveEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRequestDays(
        leaveEncashmentController.requestedDays.text.trim(), maxDays);
    if (validation != LeaveEncashmentValidationState.valid) {
      validations.add(validation);
    }
    validation = validateRequestDate(requestDate.trim());
    if (validation != LeaveEncashmentValidationState.valid) {
      validations.add(validation);
    }
    validation = validateType(leaveEncashmentController.type.text.trim());
    if (validation != LeaveEncashmentValidationState.valid) {
      validations.add(validation);
    }
    return validations;
  }

  LeaveEncashmentValidationState validateType(String type) {
    return LeaveEncashmentValidator.validateType(
      type,
    );
  }

  LeaveEncashmentValidationState validateRequestDate(String requestDate) {
    return LeaveEncashmentValidator.validateRequestDate(
      requestDate,
    );
  }

  LeaveEncashmentValidationState validateRequestDays(
      String requestDays, int maxDays) {
    return LeaveEncashmentValidator.validateRequestDays(
      requestDays,
      maxDays,
    );
  }

  LeaveEncashmentValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    return LeaveEncashmentValidator.validatePaymentMethod(
      paymentMethod,
      isVisiblePaymentMethod,
    );
  }

  LeaveEncashmentValidationState validateCurrentBalance(
      String currentBalance, bool isMandatory) {
    return LeaveEncashmentValidator.validateCurrentBalance(
        currentBalance, isMandatory);
  }

  LeaveEncashmentValidationState validateYearlyBalance(
      String yearlyBalance, bool isMandatory) {
    return LeaveEncashmentValidator.validateYearlyBalance(
        yearlyBalance, isMandatory);
  }

  LeaveEncashmentValidationState validateRemainingBalance(
      String remainingBalance, bool isMandatory) {
    return LeaveEncashmentValidator.validateRemainingBalance(
        remainingBalance, isMandatory);
  }

  LeaveEncashmentValidationState validateTotalAmount(
      String totalAmount, bool isMandatory) {
    return LeaveEncashmentValidator.validateTotalAmount(
        totalAmount, isMandatory);
  }

  LeaveEncashmentValidationState validateRemarks(
      String remarks, bool isMandatory) {
    return LeaveEncashmentValidator.validateRemarks(remarks, isMandatory);
  }

  LeaveEncashmentValidationState validateFile(String file, bool isMandatory) {
    return LeaveEncashmentValidator.validateFile(file, isMandatory);
  }
}
