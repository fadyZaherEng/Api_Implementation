part of 'leave_encashment_bloc.dart';

@immutable
abstract class LeaveEncashmentEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LeaveEncashmentBackEvent extends LeaveEncashmentEvent {}

class LeaveEncashmentOpenTypeBottomSheetEvent extends LeaveEncashmentEvent {}

class LeaveEncashmentSelectTypeEvent extends LeaveEncashmentEvent {
  final RequestType leaveEncashmentType;

  LeaveEncashmentSelectTypeEvent({
    required this.leaveEncashmentType,
  });
}

class LeaveEncashmentOpenPaymentMethodBottomSheetEvent
    extends LeaveEncashmentEvent {}

class LeaveEncashmentSelectPaymentMethodEvent extends LeaveEncashmentEvent {
  final RequestPaymentMethod requestPaymentMethod;
  final bool isVisiblePaymentMethod;

  LeaveEncashmentSelectPaymentMethodEvent({
    required this.requestPaymentMethod,
    required this.isVisiblePaymentMethod,
  });
}

class LeaveEncashmentSelectCheckBoxValueEvent extends LeaveEncashmentEvent {
  final bool checkBoxSelection;

  LeaveEncashmentSelectCheckBoxValueEvent({required this.checkBoxSelection});
}

class LeaveEncashmentOpenUploadFileBottomSheetEvent
    extends LeaveEncashmentEvent {
  final bool isMandatory;

  LeaveEncashmentOpenUploadFileBottomSheetEvent({required this.isMandatory});
}

class LeaveEncashmentOpenCameraEvent extends LeaveEncashmentEvent {
  final bool isMandatory;

  LeaveEncashmentOpenCameraEvent({required this.isMandatory});
}

class LeaveEncashmentOpenGalleryEvent extends LeaveEncashmentEvent {
  final bool isMandatory;

  LeaveEncashmentOpenGalleryEvent({required this.isMandatory});
}

class LeaveEncashmentOpenFileEvent extends LeaveEncashmentEvent {
  final bool isMandatory;

  LeaveEncashmentOpenFileEvent({required this.isMandatory});
}

class LeaveEncashmentSelectFileEvent extends LeaveEncashmentEvent {
  final String filePath;
  final bool isMandatory;

  LeaveEncashmentSelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class LeaveEncashmentDeleteFileEvent extends LeaveEncashmentEvent {
  final String filePath;
  final bool isMandatory;

  LeaveEncashmentDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ValidateLeaveEncashmentTypeEvent extends LeaveEncashmentEvent {
  final String value;

  ValidateLeaveEncashmentTypeEvent({
    required this.value,
  });
}

class LeaveEncashmentValidationRequestDateEvent extends LeaveEncashmentEvent {
  final String requestDate;

  LeaveEncashmentValidationRequestDateEvent({
    required this.requestDate,
  });
}

class LeaveEncashmentValidationRequestDaysEvent extends LeaveEncashmentEvent {
  final String requestDays;
  final RemoteGetEmployeePolicyProfileLeaveEncashmentDetails maxDays;

  LeaveEncashmentValidationRequestDaysEvent({
    required this.requestDays,
    required this.maxDays,
  });
}

class LeaveEncashmentValidationPaymentMethodEvent extends LeaveEncashmentEvent {
  final String paymentMethod;
  final bool isVisiblePaymentMethod;

  LeaveEncashmentValidationPaymentMethodEvent({
    required this.paymentMethod,
    required this.isVisiblePaymentMethod,
  });
}

class LeaveEncashmentValidationCurrentBalanceEvent
    extends LeaveEncashmentEvent {
  final String currentBalance;
  final bool isMandatory;

  LeaveEncashmentValidationCurrentBalanceEvent({
    required this.currentBalance,
    required this.isMandatory,
  });
}

class LeaveEncashmentValidationYearlyBalanceEvent extends LeaveEncashmentEvent {
  final String yearlyBalance;
  final bool isMandatory;

  LeaveEncashmentValidationYearlyBalanceEvent({
    required this.yearlyBalance,
    required this.isMandatory,
  });
}

class LeaveEncashmentValidationRemainingBalanceEvent
    extends LeaveEncashmentEvent {
  final String remainingBalance;
  final bool isMandatory;

  LeaveEncashmentValidationRemainingBalanceEvent({
    required this.remainingBalance,
    required this.isMandatory,
  });
}

class LeaveEncashmentValidationTotalAmountEvent extends LeaveEncashmentEvent {
  final String totalAmount;
  final bool isMandatory;

  LeaveEncashmentValidationTotalAmountEvent({
    required this.totalAmount,
    required this.isMandatory,
  });
}

class LeaveEncashmentValidationRemarksEvent extends LeaveEncashmentEvent {
  final String remarks;
  final bool isMandatory;

  LeaveEncashmentValidationRemarksEvent({
    required this.remarks,
    required this.isMandatory,
  });
}

class LeaveEncashmentValidationFileEvent extends LeaveEncashmentEvent {
  final String file;
  final bool isMandatory;

  LeaveEncashmentValidationFileEvent({
    required this.file,
    required this.isMandatory,
  });
}

class LeaveEncashmentSubmitEvent extends LeaveEncashmentEvent {
  final String requestDate;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final String file;
  final LeaveEncashmentController leaveEncashmentController;
  final int isByPayroll;
  final int isByCurrentBalance;
  final bool isVisiblePaymentMethod;
  final int typeID;
  final int paymentMethodId;
  final RemoteGetEmployeePolicyProfileLeaveEncashmentDetails maxDays;

  LeaveEncashmentSubmitEvent({
    required this.leaveEncashmentController,
    required this.requestDate,
    required this.allFieldsMandatory,
    required this.file,
    required this.isByPayroll,
    required this.isByCurrentBalance,
    required this.isVisiblePaymentMethod,
    required this.typeID,
    required this.paymentMethodId,
    required this.maxDays,
  });
}

class GetLeaveEncashmentTypesEvent extends LeaveEncashmentEvent {}

class GetLeaveEncashmentPaymentMethodEvent extends LeaveEncashmentEvent {}

class LeaveEncashmentShowPaymentMethodTextFieldEvent
    extends LeaveEncashmentEvent {
  final SingleSelectionModel singleSelectionModel;

  LeaveEncashmentShowPaymentMethodTextFieldEvent(
      {required this.singleSelectionModel});
}

class LeaveEncashmentGetAllFieldsMandatoryEvent extends LeaveEncashmentEvent {
  final int requestTypeId;
  final int requestData;

  LeaveEncashmentGetAllFieldsMandatoryEvent({
    required this.requestTypeId,
    required this.requestData,
  });
}

class GetEmployeePolicyProfileLeaveEncashmentDetailsEvent
    extends LeaveEncashmentEvent {
  final int employeeId;

  GetEmployeePolicyProfileLeaveEncashmentDetailsEvent({this.employeeId = 2220});
}
