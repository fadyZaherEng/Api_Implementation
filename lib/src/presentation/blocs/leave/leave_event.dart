part of 'leave_bloc.dart';

@immutable
abstract class LeaveEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LeaveBackEvent extends LeaveEvent {}

class OpenTypeBottomSheetEvent extends LeaveEvent {}

class OpenAlternativeEmployeeBottomSheetEvent extends LeaveEvent {
  final bool isMandatory;

  OpenAlternativeEmployeeBottomSheetEvent({required this.isMandatory});
}

class OpenPaymentMethodBottomSheetEvent extends LeaveEvent {}

class SelectCheckBoxValueEvent extends LeaveEvent {
  final bool value;

  SelectCheckBoxValueEvent({
    required this.value,
  });
}

class LeaveSubmitEvent extends LeaveEvent {
  final LeaveTextEditingController leaveTextEditingController;
  final String startDate;
  final String endDate;
  final String expectedResumingDate;
  final String file;
  final bool isVisiblePaymentMethod;
  final int leaveTypeId;
  final int leavePaymentMethod;
  final int alternativeEmployeeId;
  final int isByPayroll;
  final int isByCurrentBalance;

  LeaveSubmitEvent({
    required this.leaveTextEditingController,
    required this.startDate,
    required this.endDate,
    required this.expectedResumingDate,
    required this.file,
    required this.isVisiblePaymentMethod,
    required this.leaveTypeId,
    required this.leavePaymentMethod,
    required this.alternativeEmployeeId,
    required this.isByPayroll,
    required this.isByCurrentBalance,
  });
}

class SelectLeaveTypeEvent extends LeaveEvent {
  final RequestType leaveType;
  final bool isVisiblePaymentMethod;

  SelectLeaveTypeEvent({
    required this.leaveType,
    required this.isVisiblePaymentMethod,
  });
}

class SelectPaymentMethodEvent extends LeaveEvent {
  final RequestPaymentMethod paymentMethod;
  final bool isVisiblePaymentMethod;

  SelectPaymentMethodEvent({
    required this.paymentMethod,
    required this.isVisiblePaymentMethod,
  });
}

class SelectAlternativeEmployeeEvent extends LeaveEvent {
  final LeaveAlternativeEmployee alternativeEmployee;
  final bool isMandatory;

  SelectAlternativeEmployeeEvent({
    required this.alternativeEmployee,
    required this.isMandatory,
  });
}

class OpenUploadFileBottomSheetEvent extends LeaveEvent {
  final bool isMandatory;

  OpenUploadFileBottomSheetEvent({required this.isMandatory});
}

class LeaveOpenCameraEvent extends LeaveEvent {
  final bool isMandatory;

  LeaveOpenCameraEvent({required this.isMandatory});
}

class LeaveOpenGalleryEvent extends LeaveEvent {
  final bool isMandatory;

  LeaveOpenGalleryEvent({required this.isMandatory});
}

class LeaveOpenFileEvent extends LeaveEvent {
  final bool isMandatory;

  LeaveOpenFileEvent({required this.isMandatory});
}

class LeaveSelectFileEvent extends LeaveEvent {
  final String filePath;
  final bool isMandatory;

  LeaveSelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class LeaveDeleteFileEvent extends LeaveEvent {
  final String filePath;
  final bool isMandatory;

  LeaveDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ValidateLeaveTypeEvent extends LeaveEvent {
  final String value;

  ValidateLeaveTypeEvent({
    required this.value,
  });
}

class LeaveValidationStartDateEvent extends LeaveEvent {
  final String startDate;

  LeaveValidationStartDateEvent({
    required this.startDate,
  });
}

class LeaveValidationEndDateEvent extends LeaveEvent {
  final String endDate;

  LeaveValidationEndDateEvent({
    required this.endDate,
  });
}

class LeaveValidationPaymentMethodEvent extends LeaveEvent {
  final String paymentMethod;
  final bool isVisiblePaymentMethod;

  LeaveValidationPaymentMethodEvent({
    required this.paymentMethod,
    required this.isVisiblePaymentMethod,
  });
}

class LeaveValidationExpectedResumingDateEvent extends LeaveEvent {
  final String expectedResumingDate;
  final bool isMandatory;

  LeaveValidationExpectedResumingDateEvent({
    required this.expectedResumingDate,
    required this.isMandatory,
  });
}

class LeaveValidationContactNumberEvent extends LeaveEvent {
  final String contactNumber;
  final bool isMandatory;

  LeaveValidationContactNumberEvent({
    required this.contactNumber,
    required this.isMandatory,
  });
}

class LeaveValidationAddressDuringEvent extends LeaveEvent {
  final String addressDuring;
  final bool isMandatory;

  LeaveValidationAddressDuringEvent({
    required this.addressDuring,
    required this.isMandatory,
  });
}

class LeaveValidationAlternativeEmployeeEvent extends LeaveEvent {
  final String alternativeEmployee;
  final bool isMandatory;

  LeaveValidationAlternativeEmployeeEvent({
    required this.alternativeEmployee,
    required this.isMandatory,
  });
}

class LeaveValidationCurrantBalanceEvent extends LeaveEvent {
  final String currantBalance;
  final bool isMandatory;

  LeaveValidationCurrantBalanceEvent({
    required this.currantBalance,
    required this.isMandatory,
  });
}

class LeaveValidationYearlyBalanceEvent extends LeaveEvent {
  final String yearlyBalance;
  final bool isMandatory;

  LeaveValidationYearlyBalanceEvent({
    required this.yearlyBalance,
    required this.isMandatory,
  });
}

class LeaveValidationRemainingBalanceEvent extends LeaveEvent {
  final String remainingBalance;
  final bool isMandatory;

  LeaveValidationRemainingBalanceEvent({
    required this.remainingBalance,
    required this.isMandatory,
  });
}

class LeaveValidationLeaveDaysEvent extends LeaveEvent {
  final String leaveDays;
  final bool isMandatory;

  LeaveValidationLeaveDaysEvent({
    required this.leaveDays,
    required this.isMandatory,
  });
}

class LeaveValidationTotalAmountEvent extends LeaveEvent {
  final String totalAmount;
  final bool isMandatory;

  LeaveValidationTotalAmountEvent({
    required this.totalAmount,
    required this.isMandatory,
  });
}

class LeaveValidationLeaveReasonsEvent extends LeaveEvent {
  final String leaveReasons;
  final bool isMandatory;

  LeaveValidationLeaveReasonsEvent({
    required this.leaveReasons,
    required this.isMandatory,
  });
}

class LeaveValidationRemarksEvent extends LeaveEvent {
  final String remarks;
  final bool isMandatory;

  LeaveValidationRemarksEvent({
    required this.remarks,
    required this.isMandatory,
  });
}

class LeaveValidationFileEvent extends LeaveEvent {
  final String file;
  final bool isMandatory;

  LeaveValidationFileEvent({
    required this.file,
    required this.isMandatory,
  });
}

class CallLeaveTypesApiEvent extends LeaveEvent {}

class CallInsertLeaveApiEvent extends LeaveEvent {
  final LeaveTextEditingController leaveTextEditingController;
  final String startDate;
  final String endDate;
  final String expectedResumingDate;
  final String file;
 final int leaveTypeId;
 final int leavePaymentMethod;
 final int alternativeEmployeeId;
 final int isByPayroll;
 final int isByCurrentBalance;
  CallInsertLeaveApiEvent({
    required this.leaveTextEditingController,
    required this.leaveTypeId,
    required this.isByPayroll,
    required this.leavePaymentMethod,
    required this.alternativeEmployeeId,
    required this.startDate,
    required this.expectedResumingDate,
    required this.file,
    required this.endDate,
    required this.isByCurrentBalance,
  });
}

class GetLeaveAlternativeEmployeeEvent extends LeaveEvent {}

class LeaveShowPaymentMethodTextFieldEvent extends LeaveEvent {
  final SingleSelectionModel singleSelectionModel;

  LeaveShowPaymentMethodTextFieldEvent({
    required this.singleSelectionModel,
  });
}

class GetLeavePaymentMethodEvent extends LeaveEvent {}

class GetLeaveAllFieldsMandatoryEvent extends LeaveEvent {
  final int requestTypeId;
  final int requestData;

  GetLeaveAllFieldsMandatoryEvent({
    required this.requestTypeId,
    required this.requestData,
  });
}
