part of 'loans_bloc.dart';

@immutable
abstract class LoansState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LoansInitialState extends LoansState {}

class LoansLoadingState extends LoansState {}

class InsertLoanSuccessState extends LoansState {
  final String successMassage;

  InsertLoanSuccessState({required this.successMassage});
}

class LoansBackState extends LoansState {}

class LoansOpenTypeBottomSheetState extends LoansState {}

class LoansOpenPaymentMethodBottomSheetState extends LoansState {}

class LoansSelectCheckBoxValueState extends LoansState {
  final bool value;

  LoansSelectCheckBoxValueState({
    required this.value,
  });
}

class LoansValidationRemarksEmptyState extends LoansState {
  final String validationMassage;

  LoansValidationRemarksEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationRemarksValidState extends LoansState {}

class LoansValidationFileEmptyState extends LoansState {
  final String validationMassage;

  LoansValidationFileEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationFileValidState extends LoansState {}

class LoansOpenUploadFileBottomSheetState extends LoansState {
  final bool isMandatory;

  LoansOpenUploadFileBottomSheetState({
    required this.isMandatory,
  });
}

class LoansValidationInstallmentsEmptyState extends LoansState {
  final String validationMassage;

  LoansValidationInstallmentsEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationInstallmentsValidState extends LoansState {}

class LoanValidationPaymentMethodEmptyState extends LoansState {
  final String validationMassage;

  LoanValidationPaymentMethodEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationPaymentMethodValidState extends LoansState {}

class LoanValidationLoanRequestedAmountEmptyState extends LoansState {
  final String validationMassage;

  LoanValidationLoanRequestedAmountEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationLoanRequestedAmountValidState extends LoansState {}

class LoanValidationTotalAmountEmptyState extends LoansState {
  final String validationMassage;

  LoanValidationTotalAmountEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationTotalAmountValidState extends LoansState {}

class LoanValidationProfitRateEmptyState extends LoansState {
  final String validationMassage;

  LoanValidationProfitRateEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationProfitRateValidState extends LoansState {}

class LoanValidationRequestedDateEmptyState extends LoansState {
  final String validationMassage;

  LoanValidationRequestedDateEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationRequestedDateValidState extends LoansState {}

class LoanValidationStartDateEmptyState extends LoansState {
  final String validationMassage;

  LoanValidationStartDateEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationTypeEmptyState extends LoansState {
  final String validationMassage;

  LoansValidationTypeEmptyState({
    required this.validationMassage,
  });
}

class LoansValidationTypeValidState extends LoansState {}

class LoansValidationStartDateValidState extends LoansState {}

class LoansDeleteLoanRequestedDateState extends LoansState {}

class LoansDeleteLoanStartDateState extends LoansState {}

class LoansSelectTypeState extends LoansState {
  final RequestType requestType;

  LoansSelectTypeState({
    required this.requestType,
  });
}

class LoansSelectPaymentMethodState extends LoansState {
  final RequestPaymentMethod loanPaymentMethod;

  LoansSelectPaymentMethodState({
    required this.loanPaymentMethod,
  });
}

class LoansOpenCameraState extends LoansState {
  final bool isMandatory;

  LoansOpenCameraState({
    required this.isMandatory,
  });
}

class LoansOpenGalleryState extends LoansState {
  final bool isMandatory;

  LoansOpenGalleryState({
    required this.isMandatory,
  });
}

class LoansOpenFileState extends LoansState {
  final bool isMandatory;

  LoansOpenFileState({
    required this.isMandatory,
  });
}

class LoansSelectFileState extends LoansState {
  final String filePath;

  LoansSelectFileState({
    required this.filePath,
  });
}

class LoansDeleteFileState extends LoansState {
  final String filePath;

  LoansDeleteFileState({
    required this.filePath,
  });
}

class GetLoanTypesSuccessState extends LoansState {
  final List<RequestType> requestTypes;

  GetLoanTypesSuccessState({
    required this.requestTypes,
  });
}

class GetLoanTypesErrorState extends LoansState {
  final String errorMassage;

  GetLoanTypesErrorState({
    required this.errorMassage,
  });
}

class LoanGetPaymentMethodSuccessState extends LoansState {
  final List<RequestPaymentMethod> paymentMethods;

  LoanGetPaymentMethodSuccessState({
    required this.paymentMethods,
  });
}

class LoanGetPaymentMethodErrorState extends LoansState {
  final String errorMassage;

  LoanGetPaymentMethodErrorState({
    required this.errorMassage,
  });
}

class InsertLoanErrorState extends LoansState {
  final String errorMassage;

  InsertLoanErrorState({required this.errorMassage});
}

class LoanShowPaymentMethodTextFieldState extends LoansState {
  final bool isVisiblePaymentMethod;

  LoanShowPaymentMethodTextFieldState({
    required this.isVisiblePaymentMethod,
  });
}

class LoanGetAllFieldsMandatorySuccessState extends LoansState {
  final List<AllFieldsMandatory> allFieldsMandatory;

  LoanGetAllFieldsMandatorySuccessState({
    required this.allFieldsMandatory,
  });
}

class LoanGetAllFieldsMandatoryErrorState extends LoansState {
  final String errorMassage;

  LoanGetAllFieldsMandatoryErrorState({
    required this.errorMassage,
  });
}

class LoanCalculateInCaseLoanErrorState extends LoansState {
  final String errorMassage;

  LoanCalculateInCaseLoanErrorState({
    required this.errorMassage,
  });
}
