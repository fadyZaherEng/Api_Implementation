class OtherRequestValidator {
  static OtherRequestValidationState validateRequest(String request) {
    if (request.isEmpty) {
      return OtherRequestValidationState.requestEmpty;
    } else {
      return OtherRequestValidationState.valid;
    }
  }

  static OtherRequestValidationState validateRequestDate(String requestedDate) {
    if (requestedDate.isEmpty) {
      return OtherRequestValidationState.requestDateEmpty;
    } else {
      return OtherRequestValidationState.valid;
    }
  }

  static OtherRequestValidationState validateRemarks(
      String remarks, bool isMandatory) {
    if (isMandatory == true) {
      if (remarks.isEmpty) {
        return OtherRequestValidationState.remarksEmpty;
      } else {
        return OtherRequestValidationState.valid;
      }
    } else {
      return OtherRequestValidationState.valid;
    }
  }

  static OtherRequestValidationState validateNotes(
      String notes, bool isMandatory) {
    if (isMandatory == true) {
      if (notes.isEmpty) {
        return OtherRequestValidationState.notesEmpty;
      } else {
        return OtherRequestValidationState.valid;
      }
    } else {
      return OtherRequestValidationState.valid;
    }
  }

  static OtherRequestValidationState validateFile(
      String file, bool isMandatory) {
    if (isMandatory == true) {
      if (file.isEmpty) {
        return OtherRequestValidationState.fileEmpty;
      } else {
        return OtherRequestValidationState.valid;
      }
    } else {
      return OtherRequestValidationState.valid;
    }
  }
}

enum OtherRequestValidationState {
  requestEmpty,
  requestDateEmpty,
  remarksEmpty,
  notesEmpty,
  fileEmpty,
  valid,
}
