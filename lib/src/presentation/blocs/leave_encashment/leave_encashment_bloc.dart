import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/leave_encashment_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_get_employee_policy_profile_leave_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/insert_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/calculate_in_case_leave_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/get_employee_policy_profile_leave_encashment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/get_leave_encashment_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/insert_leave_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/leave_encashmen_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_controller.dart';

part 'leave_encashment_event.dart';

part 'leave_encashment_state.dart';

class LeaveEncashmentBloc
    extends Bloc<LeaveEncashmentEvent, LeaveEncashmentState> {
  final GetLeaveEncashmentTypesUseCase _getLeaveEncashmentTypesUseCase;
  final LeaveEncashmentValidationUseCase _leaveEncashmentValidationUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final InsertLeaveEncashmentUseCase _insertLeaveEncashmentUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase
      _getEmployeePolicyProfileLeaveEncashmentDetailsUseCase;
  final CalculateInCaseLeaveEncashmentUseCase
      _calculateInCaseLeaveEncashmentUseCase;

  LeaveEncashmentBloc(
    this._leaveEncashmentValidationUseCase,
    this._getLeaveEncashmentTypesUseCase,
    this._getPaymentMethodUseCase,
    this._insertLeaveEncashmentUseCase,
    this._getAllFieldsMandatoryUseCase,
    this._getEmployeePolicyProfileLeaveEncashmentDetailsUseCase,
    this._calculateInCaseLeaveEncashmentUseCase,
  ) : super(LeaveEncashmentInitialState()) {
    on<LeaveEncashmentBackEvent>(_onLeaveEncashmentBackEvent);
    on<LeaveEncashmentOpenTypeBottomSheetEvent>(
        _onLeaveEncashmentOpenTypeBottomSheetEvent);
    on<LeaveEncashmentSelectTypeEvent>(_onLeaveEncashmentSelectTypeEvent);
    on<LeaveEncashmentOpenPaymentMethodBottomSheetEvent>(
        _onLeaveEncashmentOpenPaymentMethodBottomSheetEvent);
    on<LeaveEncashmentSelectPaymentMethodEvent>(
        _onLeaveEncashmentSelectPaymentMethodEvent);
    on<LeaveEncashmentSelectCheckBoxValueEvent>(
        _onLeaveEncashmentSelectCheckBoxValueEvent);
    on<LeaveEncashmentOpenUploadFileBottomSheetEvent>(
        _onLeaveEncashmentOpenUploadFileBottomSheetEvent);
    on<LeaveEncashmentOpenCameraEvent>(_onLeaveEncashmentOpenCameraEvent);
    on<LeaveEncashmentOpenGalleryEvent>(_onLeaveEncashmentOpenGalleryEvent);
    on<LeaveEncashmentOpenFileEvent>(_onLeaveEncashmentOpenFileEvent);
    on<LeaveEncashmentSelectFileEvent>(_onLeaveEncashmentSelectFileEvent);
    on<LeaveEncashmentDeleteFileEvent>(_onLeaveEncashmentDeleteFileEvent);
    on<ValidateLeaveEncashmentTypeEvent>(_onValidateLeaveEncashmentTypeEvent);
    on<LeaveEncashmentValidationRequestDateEvent>(
        _onLeaveEncashmentValidationRequestDateEvent);
    on<LeaveEncashmentValidationRequestDaysEvent>(
        _onLeaveEncashmentValidationRequestDaysEvent);
    on<LeaveEncashmentValidationPaymentMethodEvent>(
        _onLeaveEncashmentValidationPaymentMethodEvent);
    on<LeaveEncashmentValidationCurrentBalanceEvent>(
        _onLeaveEncashmentValidationCurrentBalanceEvent);
    on<LeaveEncashmentValidationYearlyBalanceEvent>(
        _onLeaveEncashmentValidationYearlyBalanceEvent);
    on<LeaveEncashmentValidationRemainingBalanceEvent>(
        _onLeaveEncashmentValidationRemainingBalanceEvent);
    on<LeaveEncashmentValidationTotalAmountEvent>(
        _onLeaveEncashmentValidationTotalAmountEvent);
    on<LeaveEncashmentValidationRemarksEvent>(
        _onLeaveEncashmentValidationRemarksEvent);
    on<LeaveEncashmentValidationFileEvent>(
        _onLeaveEncashmentValidationFileEvent);
    on<LeaveEncashmentSubmitEvent>(_onLeaveEncashmentSubmitEvent);
    on<GetLeaveEncashmentTypesEvent>(_onGetLeaveEncashmentTypesEvent);
    on<GetLeaveEncashmentPaymentMethodEvent>(
        _onGetLeaveEncashmentPaymentMethodEvent);
    on<LeaveEncashmentShowPaymentMethodTextFieldEvent>(
        _onLeaveEncashmentShowPaymentMethodTextFieldEvent);
    on<LeaveEncashmentGetAllFieldsMandatoryEvent>(
        _onLeaveEncashmentGetAllFieldsMandatoryEvent);
    on<GetEmployeePolicyProfileLeaveEncashmentDetailsEvent>(
        _onGetEmployeePolicyProfileLeaveEncashmentDetailsEvent);
  }

  List<RequestType> _types = [];
  List<RequestPaymentMethod> _paymentMethods = [];
  List<AllFieldsMandatory> _allFieldsMandatory = [];

  List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>
      _employeePolicyProfileLeaveEncashmentDetails = [];

  FutureOr<void> _onLeaveEncashmentBackEvent(
      LeaveEncashmentBackEvent event, Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentBackState());
  }

  FutureOr<void> _onLeaveEncashmentOpenTypeBottomSheetEvent(
      LeaveEncashmentOpenTypeBottomSheetEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentOpenTypeBottomSheetState());
  }

  FutureOr<void> _onLeaveEncashmentSelectTypeEvent(
      LeaveEncashmentSelectTypeEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentSelectTypeState(
        leaveEncashmentType: event.leaveEncashmentType));

    add(ValidateLeaveEncashmentTypeEvent(
        value: event.leaveEncashmentType.name));
    add(LeaveEncashmentGetAllFieldsMandatoryEvent(
        requestTypeId: 12, requestData: event.leaveEncashmentType.id));
  }

  FutureOr<void> _onLeaveEncashmentOpenPaymentMethodBottomSheetEvent(
      LeaveEncashmentOpenPaymentMethodBottomSheetEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onLeaveEncashmentSelectPaymentMethodEvent(
      LeaveEncashmentSelectPaymentMethodEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentSelectPaymentMethodState(
        requestPaymentMethod: event.requestPaymentMethod));
    add(LeaveEncashmentValidationPaymentMethodEvent(
        paymentMethod: event.requestPaymentMethod.name,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod));
  }

  FutureOr<void> _onLeaveEncashmentSelectCheckBoxValueEvent(
      LeaveEncashmentSelectCheckBoxValueEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentSelectCheckBoxValueState(
        checkBoxSelection: event.checkBoxSelection));
  }

  FutureOr<void> _onLeaveEncashmentOpenUploadFileBottomSheetEvent(
      LeaveEncashmentOpenUploadFileBottomSheetEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentOpenUploadFileBottomSheetState(
        isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveEncashmentOpenCameraEvent(
      LeaveEncashmentOpenCameraEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveEncashmentOpenGalleryEvent(
      LeaveEncashmentOpenGalleryEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveEncashmentOpenFileEvent(
      LeaveEncashmentOpenFileEvent event, Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveEncashmentSelectFileEvent(
      LeaveEncashmentSelectFileEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentSelectFileState(
        filePath: event.filePath, isMandatory: event.isMandatory));
    add(LeaveEncashmentValidationFileEvent(
        file: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLeaveEncashmentDeleteFileEvent(
      LeaveEncashmentDeleteFileEvent event,
      Emitter<LeaveEncashmentState> emit) {
    emit(LeaveEncashmentDeleteFileState(filePath: ''));
    add(LeaveEncashmentValidationFileEvent(
        file: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onValidateLeaveEncashmentTypeEvent(
      ValidateLeaveEncashmentTypeEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateType(event.value);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentTypeValidState());
    } else {
      emit(LeaveEncashmentTypeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationRequestDateEvent(
      LeaveEncashmentValidationRequestDateEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase
            .validateRequestDate(event.requestDate);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentRequestDateValidState());
    } else {
      emit(LeaveEncashmentRequestDateEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationRequestDaysEvent(
      LeaveEncashmentValidationRequestDaysEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateRequestDays(
            event.requestDays, event.maxDays.maximumDays);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentRequestDaysValidState());
    } else if (leaveValidationState ==
        LeaveEncashmentValidationState.requestDaysNotValid) {
      emit(LeaveEncashmentRequestDaysNotValidState(
          validationMessage:
              '${S.current.maximumDaysIs} ${event.maxDays.maximumDays}'));
    } else {
      emit(LeaveEncashmentRequestDaysEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationPaymentMethodEvent(
      LeaveEncashmentValidationPaymentMethodEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validatePaymentMethod(
            event.paymentMethod, event.isVisiblePaymentMethod);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentPaymentMethodValidState());
    } else {
      emit(LeaveEncashmentPaymentMethodEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationCurrentBalanceEvent(
      LeaveEncashmentValidationCurrentBalanceEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateCurrentBalance(
            event.currentBalance, event.isMandatory);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentCurrentBalanceValidState());
    } else {
      emit(LeaveEncashmentCurrentBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationYearlyBalanceEvent(
      LeaveEncashmentValidationYearlyBalanceEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateYearlyBalance(
            event.yearlyBalance, event.isMandatory);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentYearlyBalanceValidState());
    } else {
      emit(LeaveEncashmentYearlyBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationRemainingBalanceEvent(
      LeaveEncashmentValidationRemainingBalanceEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateRemainingBalance(
            event.remainingBalance, event.isMandatory);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentRemainingBalanceValidState());
    } else {
      emit(LeaveEncashmentRemainingBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationTotalAmountEvent(
      LeaveEncashmentValidationTotalAmountEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateTotalAmount(
            event.totalAmount, event.isMandatory);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentTotalAmountValidState());
    } else {
      emit(LeaveEncashmentTotalAmountEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationRemarksEvent(
      LeaveEncashmentValidationRemarksEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateRemarks(
            event.remarks, event.isMandatory);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentRemarksValidState());
    } else {
      emit(LeaveEncashmentRemarksEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentValidationFileEvent(
      LeaveEncashmentValidationFileEvent event,
      Emitter<LeaveEncashmentState> emit) {
    LeaveEncashmentValidationState leaveValidationState =
        _leaveEncashmentValidationUseCase.validateFile(
            event.file, event.isMandatory);
    if (leaveValidationState == LeaveEncashmentValidationState.valid) {
      emit(LeaveEncashmentFileValidState());
    } else {
      emit(LeaveEncashmentFileEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLeaveEncashmentSubmitEvent(LeaveEncashmentSubmitEvent event,
      Emitter<LeaveEncashmentState> emit) async {
    final validationsState =
        _leaveEncashmentValidationUseCase.validateFormUseCase(
      requestDate: event.requestDate,
      allFieldsMandatory: event.allFieldsMandatory,
      file: event.file,
      leaveEncashmentController: event.leaveEncashmentController,
      isVisiblePaymentMethod: event.isVisiblePaymentMethod,
      maxDays: event.maxDays.maximumDays,
    );

    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == LeaveEncashmentValidationState.typeEmpty) {
          emit(LeaveEncashmentTypeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveEncashmentValidationState.requestDateEmpty) {
          emit(LeaveEncashmentRequestDateEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveEncashmentValidationState.requestDaysEmpty) {
          emit(LeaveEncashmentRequestDaysEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            LeaveEncashmentValidationState.paymentMethodEmpty) {
          emit(LeaveEncashmentPaymentMethodEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            LeaveEncashmentValidationState.currentBalanceEmpty) {
          emit(LeaveEncashmentCurrentBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            LeaveEncashmentValidationState.yearlyBalanceEmpty) {
          emit(LeaveEncashmentYearlyBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            LeaveEncashmentValidationState.remainingBalanceEmpty) {
          emit(LeaveEncashmentRemainingBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveEncashmentValidationState.totalAmountEmpty) {
          emit(LeaveEncashmentTotalAmountEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveEncashmentValidationState.remarksEmpty) {
          emit(LeaveEncashmentRemarksEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LeaveEncashmentValidationState.fileEmpty) {
          emit(LeaveEncashmentFileEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            LeaveEncashmentValidationState.requestDaysNotValid) {
          emit(LeaveEncashmentRequestDaysNotValidState(
              validationMessage:
                  '${S.current.maximumDaysIs} ${event.maxDays.maximumDays}'));
        }
      }
    } else {
      emit(LeaveEncashmentLoadingState());
      InsertLeaveEncashmentRequest insertLeaveRequest =
          InsertLeaveEncashmentRequest(
        id: 0,
        companyId: 4,
        employeeId: 2220,
        leaveEncashmentId: 1063,
        encashmentLeaveTypeId: event.typeID,
        isByPayroll: event.isByPayroll,
        paymentMethodId: event.paymentMethodId,
        requestedDate: event.requestDate,
        requestedDays:
            int.parse(event.leaveEncashmentController.requestedDays.text),
        totalAmount:
            int.parse(event.leaveEncashmentController.totalAmount.text),
        isByCurrentBalance: event.isByCurrentBalance,
        currentBalance:
            int.parse(event.leaveEncashmentController.currentBalance.text),
        yearlyBalance:
            int.parse(event.leaveEncashmentController.yearlyBalance.text),
        remainingBalance:
            int.parse(event.leaveEncashmentController.remainingBalance.text),
        basicSalaryAmount: 123,
        allowancesAmount: 100,
        remarks: event.leaveEncashmentController.remarks.text,
        transactionStatusId: 5,
        wfId: 0,
        isAllowYearlyBalance: 0,
      );
      DataState dataState = await _insertLeaveEncashmentUseCase.call(
          request: insertLeaveRequest, file: File(event.file));
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(InsertLeaveEncashmentSuccessState(
            successMassage: dataState.data!.responseMessage.toString()));
      } else {
        emit(InsertLeaveEncashmentErrorState(
            errorMassage: dataState.toString()));
      }
    }
  }

  FutureOr<void> _onGetLeaveEncashmentTypesEvent(
      GetLeaveEncashmentTypesEvent event,
      Emitter<LeaveEncashmentState> emit) async {
    emit(LeaveEncashmentLoadingState());
    DataState dataState = await _getLeaveEncashmentTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _types = dataState.data!;
      emit(GetLeaveEncashmentTypesSuccessState(types: _types));
    } else {
      emit(GetLeaveEncashmentTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetLeaveEncashmentPaymentMethodEvent(
      GetLeaveEncashmentPaymentMethodEvent event,
      Emitter<LeaveEncashmentState> emit) async {
    emit(LeaveEncashmentLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _paymentMethods = dataState.data!;
      emit(GetLeaveEncashmentPaymentMethodSuccessState(
          paymentMethods: _paymentMethods));
    } else {
      emit(GetLeaveEncashmentPaymentMethodErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onLeaveEncashmentShowPaymentMethodTextFieldEvent(
      LeaveEncashmentShowPaymentMethodTextFieldEvent event,
      Emitter<LeaveEncashmentState> emit) {
    if (event.singleSelectionModel.id == 0) {
      emit(LeaveEncashmentShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: false));
    } else {
      emit(LeaveEncashmentShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: true));
    }
  }

  FutureOr<void> _onLeaveEncashmentGetAllFieldsMandatoryEvent(
      LeaveEncashmentGetAllFieldsMandatoryEvent event,
      Emitter<LeaveEncashmentState> emit) async {
    emit(LeaveEncashmentLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestTypeId: event.requestTypeId, requestData: event.requestData);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(LeaveEncashmentGetAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(LeaveEncashmentGetAllFieldsMandatoryErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetEmployeePolicyProfileLeaveEncashmentDetailsEvent(
      GetEmployeePolicyProfileLeaveEncashmentDetailsEvent event,
      Emitter<LeaveEncashmentState> emit) async {
    emit(LeaveEncashmentLoadingState());
    DataState dataState =
        await _getEmployeePolicyProfileLeaveEncashmentDetailsUseCase(
            employeeId: event.employeeId);
    if (dataState is DataSuccess<
        List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>) {
      _employeePolicyProfileLeaveEncashmentDetails = dataState.data!;
      emit(GetEmployeePolicyProfileLeaveEncashmentDetailsSuccessState(
          employeePolicyProfileLeaveEncashmentDetails:
              _employeePolicyProfileLeaveEncashmentDetails));
    } else {
      emit(GetEmployeePolicyProfileLeaveEncashmentDetailsErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }
}
