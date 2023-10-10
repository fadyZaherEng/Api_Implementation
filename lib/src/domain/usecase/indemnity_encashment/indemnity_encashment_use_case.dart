import 'package:talent_link/src/core/utils/validation/indemnity_encashment_validator.dart';
import 'package:talent_link/src/domain/entities/indemnity_encashment/indemnity_encashment.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';

class IndemnityEncashmentValidationUseCase {
  List<IndemnityEncashmentValidationState> validateFormUseCase(
      {required String requestedDate,
      required String paymentMonth,
      required List<IndemnityEncashment> indemnitiesEncashment,
      required String file,
      required IndemnityEncashmentController indemnityEncashmentController}) {
    List<IndemnityEncashmentValidationState> validations =
        List.empty(growable: true);
    IndemnityEncashmentValidationState validation;

    for (var element in indemnitiesEncashment) {
      if (element.id == 2) {
        validation = validateFile(file.trim(), element.isMandatory);
        if (validation != IndemnityEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in indemnitiesEncashment) {
      if (element.id == 1) {
        validation = validateRemarks(
            indemnityEncashmentController.remarks.text.trim(),
            element.isMandatory);
        if (validation != IndemnityEncashmentValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    validation = validatePaymentMethod(
        indemnityEncashmentController.paymentMethod.text.trim());
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validatePaymentMonth(paymentMonth.trim());
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRequestedDays(indemnityEncashmentController.requestedDays.text.toString().trim());
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRequestDate(requestedDate.trim());
    if (validation != IndemnityEncashmentValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  IndemnityEncashmentValidationState validateRequestDate(String requestedDate) {
    return IndemnityEncashmentValidator.validateRequestDate(
      requestedDate,
    );
  }

  IndemnityEncashmentValidationState validateRequestedDays(
      String requestedDays) {
    return IndemnityEncashmentValidator.validateRequestedDays(
      requestedDays,
    );
  }

  IndemnityEncashmentValidationState validatePaymentMonth(String paymentMonth) {
    return IndemnityEncashmentValidator.validatePaymentMonth(
      paymentMonth,
    );
  }

  IndemnityEncashmentValidationState validatePaymentMethod(
      String paymentMethod) {
    return IndemnityEncashmentValidator.validatePaymentMethod(
      paymentMethod,
    );
  }

  IndemnityEncashmentValidationState validateRemarks(
      String remarks, bool isMandatory) {
    return IndemnityEncashmentValidator.validateRemarks(remarks, isMandatory);
  }

  IndemnityEncashmentValidationState validateFile(
      String file, bool isMandatory) {
    return IndemnityEncashmentValidator.validateFile(file, isMandatory);
  }
}
