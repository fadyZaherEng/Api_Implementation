import 'package:talent_link/src/core/utils/validation/other_request_validator.dart';
import 'package:talent_link/src/domain/entities/other_rquest/other_rquest.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_controller.dart';

class OtherRequestValidationUseCase {
  List<OtherRequestValidationState> validateFormUseCase({
    required List<OtherRequest> otherRequests,
    required String file,
    required String requestedDate,
    required OtherRequestController otherRequestController,
  }) {
    List<OtherRequestValidationState> validations = List.empty(growable: true);
    OtherRequestValidationState validation;
    for (var element in otherRequests) {
      if (element.id == 3) {
        validation = validateRemarks(
            otherRequestController.remarks.text.trim(), element.isMandatory);
        if (validation != OtherRequestValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in otherRequests) {
      if (element.id == 2) {
        validation = validateNotes(
            otherRequestController.notes.text.trim(), element.isMandatory);
        if (validation != OtherRequestValidationState.valid) {
          validations.add(validation);
        }
      }
    }
    for (var element in otherRequests) {
      if (element.id == 1) {
        validation = validateFile(file.trim(), element.isMandatory);
        if (validation != OtherRequestValidationState.valid) {
          validations.add(validation);
        }
      }
    }

    validation = validateRequestDate(requestedDate.trim());
    if (validation != OtherRequestValidationState.valid) {
      validations.add(validation);
    }

    validation = validateRequest(otherRequestController.request.text.trim());
    if (validation != OtherRequestValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  OtherRequestValidationState validateRequest(String request) {
    return OtherRequestValidator.validateRequest(request);
  }

  OtherRequestValidationState validateRequestDate(String requestDate) {
    return OtherRequestValidator.validateRequestDate(requestDate);
  }

  OtherRequestValidationState validateRemarks(
      String remarks, bool isMandatory) {
    return OtherRequestValidator.validateRemarks(remarks, isMandatory);
  }

  OtherRequestValidationState validateNotes(String notes, bool isMandatory) {
    return OtherRequestValidator.validateNotes(notes, isMandatory);
  }

  OtherRequestValidationState validateFile(String file, bool isMandatory) {
    return OtherRequestValidator.validateFile(file, isMandatory);
  }
}
