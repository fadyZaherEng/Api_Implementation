part of 'loans_bloc.dart';

@immutable
abstract class LoansEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LoansBackEvent extends LoansEvent {}

class LoansOpenTypeBottomSheetEvent extends LoansEvent {}

class LoansOpenPaymentMethodBottomSheetEvent extends LoansEvent {}

class LoansSelectCheckBoxValueEvent extends LoansEvent {
  final bool value;

  LoansSelectCheckBoxValueEvent({
    required this.value,
  });
}

class LoansValidationRemarksEvent extends LoansEvent {
  final String value;
  final bool isMandatory;

  LoansValidationRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class LoansOpenUploadFileBottomSheetEvent extends LoansEvent {
  final bool isMandatory;

  LoansOpenUploadFileBottomSheetEvent({
    required this.isMandatory,
  });
}

class LoansValidationInstallmentsEvent extends LoansEvent {
  final String value;

  LoansValidationInstallmentsEvent({
    required this.value,
  });
}

class LoansValidationLoanRequestedAmountEvent extends LoansEvent {
  final String value;

  LoansValidationLoanRequestedAmountEvent({
    required this.value,
  });
}

class LoansValidationTotalAmountEvent extends LoansEvent {
  final String value;

  LoansValidationTotalAmountEvent({
    required this.value,
  });
}

class LoansValidationProfitRateEvent extends LoansEvent {
  final String value;

  LoansValidationProfitRateEvent({
    required this.value,
  });
}

class LoansValidationRequestedDateEvent extends LoansEvent {
  final String value;

  LoansValidationRequestedDateEvent({
    required this.value,
  });
}

class LoansValidationStartDateEvent extends LoansEvent {
  final String value;

  LoansValidationStartDateEvent({
    required this.value,
  });
}

class LoansValidationTypeEvent extends LoansEvent {
  final String value;

  LoansValidationTypeEvent({
    required this.value,
  });
}

class LoansValidationPaymentMethodEvent extends LoansEvent {
  final String value;
  final bool isVisiblePaymentMethod;

  LoansValidationPaymentMethodEvent({
    required this.value,
    required this.isVisiblePaymentMethod,
  });
}

class LoansDeleteLoanRequestedDateEvent extends LoansEvent {}

class LoansDeleteLoanStartDateEvent extends LoansEvent {}

class LoansSubmitEvent extends LoansEvent {
  final List<AllFieldsMandatory> allFieldsMandatory;
  final String file;
  final String startDate;
  final String requestedDate;
  final LoansController loansController;
  final bool isVisiblePaymentMethod;
  final int paymentMethodId;
  final int typeId;
  final int isPayroll;
  final int isByCurrentBalance;

  LoansSubmitEvent({
    required this.file,
    required this.startDate,
    required this.requestedDate,
    required this.allFieldsMandatory,
    required this.loansController,
    required this.isVisiblePaymentMethod,
    required this.paymentMethodId,
    required this.typeId,
    required this.isPayroll,
    required this.isByCurrentBalance,
  });
}

class LoansSelectTypeEvent extends LoansEvent {
  final RequestType requestType;

  LoansSelectTypeEvent({
    required this.requestType,
  });
}

class LoansSelectPaymentMethodEvent extends LoansEvent {
  final RequestPaymentMethod loanPaymentMethod;
  final bool isVisiblePaymentMethod;

  LoansSelectPaymentMethodEvent({
    required this.loanPaymentMethod,
    required this.isVisiblePaymentMethod,
  });
}

class LoansOpenCameraEvent extends LoansEvent {
  final bool isMandatory;

  LoansOpenCameraEvent({
    required this.isMandatory,
  });
}

class LoansOpenGalleryEvent extends LoansEvent {
  final bool isMandatory;

  LoansOpenGalleryEvent({
    required this.isMandatory,
  });
}

class LoansOpenFileEvent extends LoansEvent {
  final bool isMandatory;

  LoansOpenFileEvent({
    required this.isMandatory,
  });
}

class LoansSelectFileEvent extends LoansEvent {
  final String filePath;
  final bool isMandatory;

  LoansSelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class LoansDeleteFileEvent extends LoansEvent {
  final String filePath;
  final bool isMandatory;

  LoansDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class LoansValidationFileEvent extends LoansEvent {
  final String filePath;
  final bool isMandatory;

  LoansValidationFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class GetLoanTypesEvent extends LoansEvent {}

class LoanGetPaymentMethodEvent extends LoansEvent {}

class LoanShowPaymentMethodTextFieldEvent extends LoansEvent {
  final SingleSelectionModel selectionModel;

  LoanShowPaymentMethodTextFieldEvent({required this.selectionModel});
}

class LoanGetAllFieldsMandatoryEvent extends LoansEvent {
  final int requestTypeId;
  final int requestData;

  LoanGetAllFieldsMandatoryEvent({
    required this.requestTypeId,
    required this.requestData,
  });
}

class LoanCalculateInCaseLoanEvent extends LoansEvent {
  final String file;
  final String startDate;
  final String requestedDate;
  final LoansController loansController;
  final bool isVisiblePaymentMethod;
  final int paymentMethodId;
  final int typeId;
  final int isPayroll;
  final int isByCurrentBalance;

  LoanCalculateInCaseLoanEvent({
    required this.file,
    required this.startDate,
    required this.requestedDate,
    required this.loansController,
    required this.isVisiblePaymentMethod,
    required this.paymentMethodId,
    required this.typeId,
    required this.isPayroll,
    required this.isByCurrentBalance,
  });
}
