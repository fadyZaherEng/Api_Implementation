import 'package:talent_link/src/core/utils/validation/loan_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_controller.dart';

class LoansValidationUseCase {
  List<LoansValidationState> validateFormUseCase({
    required List<AllFieldsMandatory> allFieldsMandatory,
    required String file,
    required String startDate,
    required String requestedDate,
    required LoansController loansController,
    required bool isVisiblePaymentMethod,
  }) {
    List<LoansValidationState> validations = List.empty(growable: true);
    LoansValidationState validation;
    for (var element in allFieldsMandatory) {
      if (element.fieldKey == "remarks") {
        validation = validateRemarks(
            loansController.remarks.text.trim(), element.isRequired);
        if (validation != LoansValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in allFieldsMandatory) {
      if (element.fieldKey =="employeeLoanAttachments") {
        validation = validateFile(file.trim(), element.isRequired);
        if (validation != LoansValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    validation =
        validatePaymentMethod(loansController.paymentMethod.text.trim(),isVisiblePaymentMethod);
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }
    validation = validateInstallments(loansController.installments.text.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateLoanTotalAmount(loansController.loanTotalAmount.text.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }

    validation = validateLoanProfitRate(loansController.profitRate.text.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }

    validation = validateLoanRequestedAmount(
        loansController.loanRequestedAmount.text.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }
    validation = validateLoanStartDate(startDate.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }
    validation = validateLoanRequestedDate(requestedDate.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }
    validation = validateLoanType(loansController.type.text.trim());
    if (validation != LoansValidationState.valid) {
      validations.add(validation);
    }
    return validations;
  }

  LoansValidationState validateLoanType(String type) {
    return LoansValidator.validateType(type);
  }

  LoansValidationState validateLoanRequestedDate(String requestedDate) {
    return LoansValidator.validateLoanRequestedDate(requestedDate);
  }

  LoansValidationState validateLoanStartDate(String startDate) {
    return LoansValidator.validateLoanStartDate(startDate);
  }

  LoansValidationState validateLoanRequestedAmount(String requestedAmount) {
    return LoansValidator.validateLoanRequestedAmount(requestedAmount);
  }

  LoansValidationState validateLoanProfitRate(String profitRate) {
    return LoansValidator.validateLoanProfitRate(profitRate);
  }

  LoansValidationState validateLoanTotalAmount(String loanTotalAmount) {
    return LoansValidator.validateLoanTotalAmount(loanTotalAmount);
  }

  LoansValidationState validateInstallments(String installments) {
    return LoansValidator.validateInstallments(installments);
  }

  LoansValidationState validatePaymentMethod(String paymentMethod,bool isVisiblePaymentMethod) {
    return LoansValidator.validatePaymentMethod(paymentMethod,isVisiblePaymentMethod);
  }

  LoansValidationState validateRemarks(String remarks, bool isMandatory) {
    return LoansValidator.validateRemarks(remarks, isMandatory);
  }

  LoansValidationState validateFile(String file, bool isMandatory) {
    return LoansValidator.validateFile(file, isMandatory);
  }
}
