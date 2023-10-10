part of 'leave_bloc.dart';

@immutable
abstract class LeaveState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LeaveInitialState extends LeaveState {}

class LeaveLoadingState extends LeaveState {}

class LeaveSuccessState extends LeaveState {
  final String successMassage;

  LeaveSuccessState({required this.successMassage});
}

class LeaveBackState extends LeaveState {}

class OpenTypeBottomSheetState extends LeaveState {}

class OpenAlternativeEmployeeBottomSheetState extends LeaveState {
  final bool isMandatory;

  OpenAlternativeEmployeeBottomSheetState({required this.isMandatory});
}

class OpenPaymentMethodBottomSheetState extends LeaveState {}

class SelectCheckBoxValueState extends LeaveState {
  final bool value;

  SelectCheckBoxValueState({
    required this.value,
  });
}

class SelectLeaveTypeState extends LeaveState {
  final RequestType leaveType;

  SelectLeaveTypeState({
    required this.leaveType,
  });
}

class SelectPaymentMethodState extends LeaveState {
  final RequestPaymentMethod paymentMethod;

  SelectPaymentMethodState({
    required this.paymentMethod,
  });
}

class SelectAlternativeEmployeeState extends LeaveState {
  final LeaveAlternativeEmployee alternativeEmployee;

  SelectAlternativeEmployeeState({
    required this.alternativeEmployee,
  });
}

class OpenUploadFileBottomSheetState extends LeaveState {
  final bool isMandatory;

  OpenUploadFileBottomSheetState({required this.isMandatory});
}

class LeaveOpenCameraState extends LeaveState {
  final bool isMandatory;

  LeaveOpenCameraState({required this.isMandatory});
}

class LeaveOpenGalleryState extends LeaveState {
  final bool isMandatory;

  LeaveOpenGalleryState({required this.isMandatory});
}

class LeaveOpenFileState extends LeaveState {
  final bool isMandatory;

  LeaveOpenFileState({required this.isMandatory});
}

class LeaveSelectFileState extends LeaveState {
  final String filePath;

  LeaveSelectFileState({
    required this.filePath,
  });
}

class LeaveDeleteFileState extends LeaveState {
  final String filePath;

  LeaveDeleteFileState({
    required this.filePath,
  });
}

class LeaveTypeEmptyState extends LeaveState {
  final String validationMessage;

  LeaveTypeEmptyState({
    required this.validationMessage,
  });
}

class LeaveTypeValidState extends LeaveState {}

class LeaveStartDateEmptyState extends LeaveState {
  final String validationMessage;

  LeaveStartDateEmptyState({
    required this.validationMessage,
  });
}

class LeaveStartDateValidState extends LeaveState {}

class LeaveEndDateEmptyState extends LeaveState {
  final String validationMessage;

  LeaveEndDateEmptyState({
    required this.validationMessage,
  });
}

class LeaveEndDateValidState extends LeaveState {}

class LeavePaymentMethodEmptyState extends LeaveState {
  final String validationMessage;

  LeavePaymentMethodEmptyState({
    required this.validationMessage,
  });
}

class LeavePaymentMethodValidState extends LeaveState {}

class LeaveExpectedResumingDateEmptyState extends LeaveState {
  final String validationMessage;

  LeaveExpectedResumingDateEmptyState({
    required this.validationMessage,
  });
}

class LeaveExpectedResumingDateValidState extends LeaveState {}

class LeaveContactNumberEmptyState extends LeaveState {
  final String validationMessage;

  LeaveContactNumberEmptyState({
    required this.validationMessage,
  });
}

class LeaveContactNumberValidState extends LeaveState {}

class LeaveAddressDuringEmptyState extends LeaveState {
  final String validationMessage;

  LeaveAddressDuringEmptyState({
    required this.validationMessage,
  });
}

class LeaveAddressDuringValidState extends LeaveState {}

class LeaveAlternativeEmployeeEmptyState extends LeaveState {
  final String validationMessage;

  LeaveAlternativeEmployeeEmptyState({
    required this.validationMessage,
  });
}

class LeaveAlternativeEmployeeValidState extends LeaveState {}

class LeaveCurrentBalanceEmptyState extends LeaveState {
  final String validationMessage;

  LeaveCurrentBalanceEmptyState({
    required this.validationMessage,
  });
}

class LeaveCurrantBalanceValidState extends LeaveState {}

class LeaveYearlyBalanceEmptyState extends LeaveState {
  final String validationMessage;

  LeaveYearlyBalanceEmptyState({
    required this.validationMessage,
  });
}

class LeaveYearlyBalanceValidState extends LeaveState {}

class LeaveRemainingBalanceEmptyState extends LeaveState {
  final String validationMessage;

  LeaveRemainingBalanceEmptyState({
    required this.validationMessage,
  });
}

class LeaveRemainingBalanceValidState extends LeaveState {}

class LeaveDaysEmptyState extends LeaveState {
  final String validationMessage;

  LeaveDaysEmptyState({
    required this.validationMessage,
  });
}

class LeaveDaysValidState extends LeaveState {}

class LeaveTotalAmountEmptyState extends LeaveState {
  final String validationMessage;

  LeaveTotalAmountEmptyState({
    required this.validationMessage,
  });
}

class LeaveTotalAmountValidState extends LeaveState {}

class LeaveReasonsEmptyState extends LeaveState {
  final String validationMessage;

  LeaveReasonsEmptyState({
    required this.validationMessage,
  });
}

class LeaveReasonsValidState extends LeaveState {}

class LeaveRemarksEmptyState extends LeaveState {
  final String validationMessage;

  LeaveRemarksEmptyState({
    required this.validationMessage,
  });
}

class LeaveRemarksValidState extends LeaveState {}

class LeaveFileEmptyState extends LeaveState {
  final String validationMessage;

  LeaveFileEmptyState({
    required this.validationMessage,
  });
}

class LeaveFileValidState extends LeaveState {}

class GetLeaveAlternativeEmployeeSuccessState extends LeaveState {
  final List<LeaveAlternativeEmployee> alternativeEmployees;

  GetLeaveAlternativeEmployeeSuccessState({required this.alternativeEmployees});
}

class GetLeaveAlternativeEmployeeErrorState extends LeaveState {
  final String errorMassage;

  GetLeaveAlternativeEmployeeErrorState({required this.errorMassage});
}

class CallLeaveTypesApiSuccessState extends LeaveState {
  final List<RequestType> requestTypes;

  CallLeaveTypesApiSuccessState({required this.requestTypes});
}

class CallLeaveTypesApiErrorState extends LeaveState {
  final String errorMassage;

  CallLeaveTypesApiErrorState({
    required this.errorMassage,
  });
}

class LeaveShowPaymentMethodTextFieldState extends LeaveState {
  final bool isVisiblePaymentMethod;

  LeaveShowPaymentMethodTextFieldState({
    required this.isVisiblePaymentMethod,
  });
}

class GetLeavePaymentMethodSuccessState extends LeaveState {
  final List<RequestPaymentMethod> paymentMethods;

  GetLeavePaymentMethodSuccessState({
    required this.paymentMethods,
  });
}

class GetLeavePaymentMethodErrorState extends LeaveState {
  final String errorMassage;

  GetLeavePaymentMethodErrorState({
    required this.errorMassage,
  });
}

class GetLeaveAllFieldsMandatorySuccessState extends LeaveState {
  final List<AllFieldsMandatory> allFieldsMandatory;

  GetLeaveAllFieldsMandatorySuccessState({
    required this.allFieldsMandatory,
  });
}

class GetLeaveAllFieldsMandatoryErrorState extends LeaveState {
  final String errorMassage;

  GetLeaveAllFieldsMandatoryErrorState({
    required this.errorMassage,
  });
}

class InsertLeaveSuccessState extends LeaveState {
  final String successMassage;

  InsertLeaveSuccessState({required this.successMassage});
}

class InsertLeaveErrorState extends LeaveState {
  final String errorMassage;

  InsertLeaveErrorState({
    required this.errorMassage,
  });
}
