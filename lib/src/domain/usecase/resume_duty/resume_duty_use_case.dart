import 'package:talent_link/src/core/utils/validation/resume_duty_validator.dart';
import 'package:talent_link/src/domain/entities/resume_duty/resume_duty.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';

class ResumeDutyValidationUseCase {
  List<ResumeDutyValidationState> validateFormUseCase(
      {required List<ResumeDuty> resumeDuties,
      required String file,
      required String actualResumeDutyData,
      required ResumeDutyController resumeDutyController,
      required bool isVisiblePaymentMethod}) {
    List<ResumeDutyValidationState> validations = List.empty(growable: true);
    ResumeDutyValidationState validation;
    for (var element in resumeDuties) {
      if (element.id == 2) {
        validation = validateRemarks(
            resumeDutyController.remarks.text.trim(), element.isMandatory);
        if (validation != ResumeDutyValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in resumeDuties) {
      if (element.id == 1) {
        validation = validateFile(file.trim(), element.isMandatory);
        if (validation != ResumeDutyValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    validation = validateActualResumeDutyDate(actualResumeDutyData.trim());
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }
    validation = validatePaymentMethod(
        resumeDutyController.paymentMethod.text.trim(), isVisiblePaymentMethod);
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }
    validation =
        validateReferenceData(resumeDutyController.referenceData.text.trim());
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateReferenceType(resumeDutyController.referenceType.text.trim());
    if (validation != ResumeDutyValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  ResumeDutyValidationState validateReferenceType(String referenceType) {
    return ResumeDutyValidator.validateReferenceType(referenceType);
  }

  ResumeDutyValidationState validateReferenceData(String referenceData) {
    return ResumeDutyValidator.validateReferenceData(referenceData);
  }

  ResumeDutyValidationState validatePaymentMethod(
      String paymentMethod, bool isVisiblePaymentMethod) {
    return ResumeDutyValidator.validatePaymentMethod(
        paymentMethod, isVisiblePaymentMethod);
  }

  ResumeDutyValidationState validateActualResumeDutyDate(
      String actualResumeDutyData) {
    return ResumeDutyValidator.validateActualResumeDutyDate(
        actualResumeDutyData);
  }

  ResumeDutyValidationState validateRemarks(String remarks, bool isMandatory) {
    return ResumeDutyValidator.validateRemarks(remarks, isMandatory);
  }

  ResumeDutyValidationState validateFile(String file, bool isMandatory) {
    return ResumeDutyValidator.validateFile(file, isMandatory);
  }
}
