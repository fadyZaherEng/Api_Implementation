part of 'leave_encashment_bloc.dart';

@immutable
abstract class LeaveEncashmentState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LeaveEncashmentInitialState extends LeaveEncashmentState {}

class LeaveEncashmentLoadingState extends LeaveEncashmentState {}

class LeaveEncashmentBackState extends LeaveEncashmentState {}

class LeaveEncashmentOpenTypeBottomSheetState extends LeaveEncashmentState {}

class LeaveEncashmentSelectTypeState extends LeaveEncashmentState {
  final RequestType leaveEncashmentType;

  LeaveEncashmentSelectTypeState({required this.leaveEncashmentType});
}

class LeaveEncashmentOpenPaymentMethodBottomSheetState
    extends LeaveEncashmentState {}

class LeaveEncashmentSelectPaymentMethodState extends LeaveEncashmentState {
  final RequestPaymentMethod requestPaymentMethod;

  LeaveEncashmentSelectPaymentMethodState({required this.requestPaymentMethod});
}

class LeaveEncashmentSelectCheckBoxValueState extends LeaveEncashmentState {
  final bool checkBoxSelection;

  LeaveEncashmentSelectCheckBoxValueState({required this.checkBoxSelection});
}

class LeaveEncashmentOpenUploadFileBottomSheetState
    extends LeaveEncashmentState {
  final bool isMandatory;

  LeaveEncashmentOpenUploadFileBottomSheetState({required this.isMandatory});
}

class LeaveEncashmentOpenCameraState extends LeaveEncashmentState {
  final bool isMandatory;

  LeaveEncashmentOpenCameraState({required this.isMandatory});
}

class LeaveEncashmentOpenGalleryState extends LeaveEncashmentState {
  final bool isMandatory;

  LeaveEncashmentOpenGalleryState({required this.isMandatory});
}

class LeaveEncashmentOpenFileState extends LeaveEncashmentState {
  final bool isMandatory;

  LeaveEncashmentOpenFileState({required this.isMandatory});
}

class LeaveEncashmentSelectFileState extends LeaveEncashmentState {
  final String filePath;
  final bool isMandatory;

  LeaveEncashmentSelectFileState({
    required this.filePath,
    required this.isMandatory,
  });
}

class LeaveEncashmentDeleteFileState extends LeaveEncashmentState {
  final String filePath;

  LeaveEncashmentDeleteFileState({
    required this.filePath,
  });
}

class LeaveEncashmentTypeEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentTypeEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentTypeValidState extends LeaveEncashmentState {}

class LeaveEncashmentRequestDateEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentRequestDateEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentRequestDateValidState extends LeaveEncashmentState {}

class LeaveEncashmentRequestDaysEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentRequestDaysEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentRequestDaysValidState extends LeaveEncashmentState {}

class LeaveEncashmentPaymentMethodEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentPaymentMethodEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentPaymentMethodValidState extends LeaveEncashmentState {}

class LeaveEncashmentCurrentBalanceEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentCurrentBalanceEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentCurrentBalanceValidState extends LeaveEncashmentState {}

class LeaveEncashmentYearlyBalanceEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentYearlyBalanceEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentYearlyBalanceValidState extends LeaveEncashmentState {}

class LeaveEncashmentRemainingBalanceEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentRemainingBalanceEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentRemainingBalanceValidState extends LeaveEncashmentState {}

class LeaveEncashmentTotalAmountEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentTotalAmountEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentTotalAmountValidState extends LeaveEncashmentState {}

class LeaveEncashmentRemarksEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentRemarksEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentRemarksValidState extends LeaveEncashmentState {}

class LeaveEncashmentFileEmptyState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentFileEmptyState({
    required this.validationMessage,
  });
}

class LeaveEncashmentFileValidState extends LeaveEncashmentState {}

class InsertLeaveEncashmentSuccessState extends LeaveEncashmentState {
  final String successMassage;

  InsertLeaveEncashmentSuccessState({required this.successMassage});
}

class InsertLeaveEncashmentErrorState extends LeaveEncashmentState {
  final String errorMassage;

  InsertLeaveEncashmentErrorState({required this.errorMassage});
}

class GetLeaveEncashmentTypesSuccessState extends LeaveEncashmentState {
  final List<RequestType> types;

  GetLeaveEncashmentTypesSuccessState({required this.types});
}

class GetLeaveEncashmentTypesErrorState extends LeaveEncashmentState {
  final String errorMassage;

  GetLeaveEncashmentTypesErrorState({required this.errorMassage});
}

class GetLeaveEncashmentPaymentMethodSuccessState extends LeaveEncashmentState {
  final List<RequestPaymentMethod> paymentMethods;

  GetLeaveEncashmentPaymentMethodSuccessState({required this.paymentMethods});
}

class GetLeaveEncashmentPaymentMethodErrorState extends LeaveEncashmentState {
  final String errorMassage;

  GetLeaveEncashmentPaymentMethodErrorState({required this.errorMassage});
}

class LeaveEncashmentShowPaymentMethodTextFieldState
    extends LeaveEncashmentState {
  final bool isVisiblePaymentMethod;

  LeaveEncashmentShowPaymentMethodTextFieldState({
    required this.isVisiblePaymentMethod,
  });
}

class LeaveEncashmentGetAllFieldsMandatorySuccessState
    extends LeaveEncashmentState {
  final List<AllFieldsMandatory> allFieldsMandatory;

  LeaveEncashmentGetAllFieldsMandatorySuccessState({
    required this.allFieldsMandatory,
  });
}

class LeaveEncashmentGetAllFieldsMandatoryErrorState
    extends LeaveEncashmentState {
  final String errorMassage;

  LeaveEncashmentGetAllFieldsMandatoryErrorState({
    required this.errorMassage,
  });
}

class GetEmployeePolicyProfileLeaveEncashmentDetailsSuccessState
    extends LeaveEncashmentState {
  final List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>
      employeePolicyProfileLeaveEncashmentDetails;

  GetEmployeePolicyProfileLeaveEncashmentDetailsSuccessState({
    required this.employeePolicyProfileLeaveEncashmentDetails,
  });
}

class GetEmployeePolicyProfileLeaveEncashmentDetailsErrorState
    extends LeaveEncashmentState {
  final String errorMassage;

  GetEmployeePolicyProfileLeaveEncashmentDetailsErrorState({
    required this.errorMassage,
  });
}


class LeaveEncashmentRequestDaysNotValidState extends LeaveEncashmentState {
  final String validationMessage;

  LeaveEncashmentRequestDaysNotValidState({
    required this.validationMessage,
  });
}