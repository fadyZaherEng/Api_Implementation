import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/loan_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_calculate_in_case_loan.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/calculate_in_case_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/insert_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/calculate_in_case_loan_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/get_loan_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/insert_loan_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/loans_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_controller.dart';

part 'loans_event.dart';

part 'loans_state.dart';

class LoansBloc extends Bloc<LoansEvent, LoansState> {
  final LoansValidationUseCase _loansValidationUseCase;
  final GetLoanTypesUseCase _getLoanTypesUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final InsertLoanUseCase _insertLoanUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final CalculateInCaseLoanUseCase _calculateInCaseLoanUseCase;

  LoansBloc(
    this._loansValidationUseCase,
    this._getLoanTypesUseCase,
    this._getPaymentMethodUseCase,
    this._insertLoanUseCase,
    this._getAllFieldsMandatoryUseCase,
    this._calculateInCaseLoanUseCase,
  ) : super(LoansInitialState()) {
    on<LoansBackEvent>(_onLoansBackEvent);
    on<LoansOpenTypeBottomSheetEvent>(_onLoanOpenTypeBottomSheetEvent);
    on<LoansOpenPaymentMethodBottomSheetEvent>(
        _onLoanOpenPaymentMethodBottomSheetEvent);
    on<LoansSelectCheckBoxValueEvent>(_onLoanSelectCheckBoxValueEvent);
    on<LoansValidationRemarksEvent>(_onLoanValidationRemarksEvent);
    on<LoansOpenUploadFileBottomSheetEvent>(
        _onLoanOpenUploadFileBottomSheetEvent);
    on<LoansValidationInstallmentsEvent>(_onLoanValidationInstallmentsEvent);
    on<LoansValidationLoanRequestedAmountEvent>(
        _onLoanValidationLoanRequestedAmountEvent);
    on<LoansValidationTotalAmountEvent>(_onLoanValidationTotalAmountEvent);
    on<LoansValidationProfitRateEvent>(_onLoanValidationProfitRateEvent);
    on<LoansValidationRequestedDateEvent>(_onLoanValidationRequestedDateEvent);
    on<LoansValidationStartDateEvent>(_onLoanValidationStartDateEvent);
    on<LoansDeleteLoanRequestedDateEvent>(_onLoanDeleteLoanRequestedDateEvent);
    on<LoansDeleteLoanStartDateEvent>(_onLoanDeleteLoanStartDateEvent);
    on<LoansSubmitEvent>(_onLoanSubmitEvent);
    on<LoansSelectTypeEvent>(_onLoanSelectTypeEvent);
    on<LoansSelectPaymentMethodEvent>(_onLoanSelectPaymentMethodEvent);
    on<LoansOpenCameraEvent>(_onLoanOpenCameraEvent);
    on<LoansOpenGalleryEvent>(_onLoanOpenGalleryEvent);
    on<LoansOpenFileEvent>(_onLoanOpenFileEvent);
    on<LoansSelectFileEvent>(_onLoanSelectFileEvent);
    on<LoansDeleteFileEvent>(_onLoanDeleteFileEvent);
    on<LoansValidationTypeEvent>(_onLoanValidationTypeEvent);
    on<LoansValidationPaymentMethodEvent>(_onLoanValidationPaymentMethodEvent);
    on<LoansValidationFileEvent>(_onLoanValidationFileEvent);
    on<GetLoanTypesEvent>(_onGetLoanTypesEvent);
    on<LoanGetPaymentMethodEvent>(_onLoanGetPaymentMethodEvent);
    on<LoanShowPaymentMethodTextFieldEvent>(
        _onLoanShowPaymentMethodTextFieldEvent);
    on<LoanGetAllFieldsMandatoryEvent>(_onLoanGetAllFieldsMandatoryEvent);
    on<LoanCalculateInCaseLoanEvent>(_onLoanCalculateInCaseLoanEvent);
  }

  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestType> _loanTypes = [];
  List<RequestPaymentMethod> _loanPaymentMethods = [];

  FutureOr<void> _onLoansBackEvent(
      LoansBackEvent event, Emitter<LoansState> emit) {
    emit(LoansBackState());
  }

  FutureOr<void> _onLoanOpenTypeBottomSheetEvent(
      LoansOpenTypeBottomSheetEvent event, Emitter<LoansState> emit) {
    emit(LoansOpenTypeBottomSheetState());
  }

  FutureOr<void> _onLoanOpenPaymentMethodBottomSheetEvent(
      LoansOpenPaymentMethodBottomSheetEvent event, Emitter<LoansState> emit) {
    emit(LoansOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onLoanSelectCheckBoxValueEvent(
      LoansSelectCheckBoxValueEvent event, Emitter<LoansState> emit) {
    emit(LoansSelectCheckBoxValueState(value: event.value));
  }

  FutureOr<void> _onLoanValidationRemarksEvent(
      LoansValidationRemarksEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateRemarks(event.value, event.isMandatory);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationRemarksValidState());
    } else {
      emit(LoansValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanOpenUploadFileBottomSheetEvent(
      LoansOpenUploadFileBottomSheetEvent event, Emitter<LoansState> emit) {
    emit(LoansOpenUploadFileBottomSheetState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLoanValidationInstallmentsEvent(
      LoansValidationInstallmentsEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateInstallments(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationInstallmentsValidState());
    } else {
      emit(LoansValidationInstallmentsEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationLoanRequestedAmountEvent(
      LoansValidationLoanRequestedAmountEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateLoanRequestedAmount(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationLoanRequestedAmountValidState());
    } else {
      emit(LoanValidationLoanRequestedAmountEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationTotalAmountEvent(
      LoansValidationTotalAmountEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateLoanTotalAmount(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationTotalAmountValidState());
    } else {
      emit(LoanValidationTotalAmountEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationProfitRateEvent(
      LoansValidationProfitRateEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateLoanProfitRate(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationProfitRateValidState());
    } else {
      emit(LoanValidationProfitRateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationRequestedDateEvent(
      LoansValidationRequestedDateEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateLoanRequestedDate(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationRequestedDateValidState());
    } else {
      emit(LoanValidationRequestedDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationStartDateEvent(
      LoansValidationStartDateEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateLoanStartDate(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationStartDateValidState());
    } else {
      emit(LoanValidationStartDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanDeleteLoanRequestedDateEvent(
      LoansDeleteLoanRequestedDateEvent event, Emitter<LoansState> emit) {
    add(LoansValidationRequestedDateEvent(value: ''));
  }

  FutureOr<void> _onLoanDeleteLoanStartDateEvent(
      LoansDeleteLoanStartDateEvent event, Emitter<LoansState> emit) {
    add(LoansValidationStartDateEvent(value: ''));
  }

  FutureOr<void> _onLoanSubmitEvent(
      LoansSubmitEvent event, Emitter<LoansState> emit) async {
    final validationsState = _loansValidationUseCase.validateFormUseCase(
        startDate: event.startDate,
        allFieldsMandatory: event.allFieldsMandatory,
        loansController: event.loansController,
        requestedDate: event.requestedDate,
        file: event.file,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == LoansValidationState.typeEmpty) {
          emit(LoansValidationTypeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanRequestedDateEmpty) {
          emit(LoanValidationRequestedDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanStartDateEmpty) {
          emit(LoanValidationStartDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanRequestedAmountEmpty) {
          emit(LoanValidationLoanRequestedAmountEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanProfitRateEmpty) {
          emit(LoanValidationProfitRateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanTotalAmountEmpty) {
          emit(LoanValidationTotalAmountEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanInstallmentsEmpty) {
          emit(LoansValidationInstallmentsEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanPaymentMethodEmpty) {
          emit(LoanValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.loanRemarksEmpty) {
          emit(LoansValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == LoansValidationState.fileEmpty) {
          emit(LoansValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(LoansLoadingState());
      add(LoanCalculateInCaseLoanEvent(
        isVisiblePaymentMethod: event.isVisiblePaymentMethod,
        paymentMethodId: event.paymentMethodId,
        isPayroll: event.isPayroll,
        isByCurrentBalance: event.isByCurrentBalance,
        file: event.file,
        requestedDate: event.requestedDate,
        loansController: event.loansController,
        startDate: event.startDate,
        typeId: event.typeId,
      ));
    }
  }

  FutureOr<void> _onLoanSelectTypeEvent(
      LoansSelectTypeEvent event, Emitter<LoansState> emit) {
    emit(LoansSelectTypeState(requestType: event.requestType));
    add(LoansValidationTypeEvent(value: event.requestType.name));
  }

  FutureOr<void> _onLoanSelectPaymentMethodEvent(
      LoansSelectPaymentMethodEvent event, Emitter<LoansState> emit) {
    emit(LoansSelectPaymentMethodState(
        loanPaymentMethod: event.loanPaymentMethod));
    add(LoansValidationPaymentMethodEvent(
        value: event.loanPaymentMethod.name,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod));
  }

  FutureOr<void> _onLoanOpenCameraEvent(
      LoansOpenCameraEvent event, Emitter<LoansState> emit) {
    emit(LoansOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLoanOpenGalleryEvent(
      LoansOpenGalleryEvent event, Emitter<LoansState> emit) {
    emit(LoansOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLoanOpenFileEvent(
      LoansOpenFileEvent event, Emitter<LoansState> emit) {
    emit(LoansOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLoanSelectFileEvent(
      LoansSelectFileEvent event, Emitter<LoansState> emit) {
    emit(LoansSelectFileState(filePath: event.filePath));
    add(LoansValidationFileEvent(
        filePath: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLoanDeleteFileEvent(
      LoansDeleteFileEvent event, Emitter<LoansState> emit) {
    emit(LoansDeleteFileState(filePath: ''));
    add(LoansValidationFileEvent(filePath: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onLoanValidationTypeEvent(
      LoansValidationTypeEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateLoanType(event.value);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationTypeValidState());
    } else {
      emit(LoansValidationTypeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationPaymentMethodEvent(
      LoansValidationPaymentMethodEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState = _loansValidationUseCase
        .validatePaymentMethod(event.value, event.isVisiblePaymentMethod);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationPaymentMethodValidState());
    } else {
      emit(LoanValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onLoanValidationFileEvent(
      LoansValidationFileEvent event, Emitter<LoansState> emit) {
    LoansValidationState loansValidationState =
        _loansValidationUseCase.validateFile(event.filePath, event.isMandatory);
    if (loansValidationState == LoansValidationState.valid) {
      emit(LoansValidationFileValidState());
    } else {
      emit(LoansValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetLoanTypesEvent(
      GetLoanTypesEvent event, Emitter<LoansState> emit) async {
    emit(LoansLoadingState());
    DataState dataState = await _getLoanTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _loanTypes = dataState.data!;
      emit(GetLoanTypesSuccessState(requestTypes: _loanTypes));
    } else {
      emit(GetLoanTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onLoanGetPaymentMethodEvent(
      LoanGetPaymentMethodEvent event, Emitter<LoansState> emit) async {
    emit(LoansLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _loanPaymentMethods = dataState.data!;
      emit(LoanGetPaymentMethodSuccessState(
          paymentMethods: _loanPaymentMethods));
    } else {
      emit(LoanGetPaymentMethodErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onLoanShowPaymentMethodTextFieldEvent(
      LoanShowPaymentMethodTextFieldEvent event, Emitter<LoansState> emit) {
    if (event.selectionModel.id == 0) {
      emit(LoanShowPaymentMethodTextFieldState(isVisiblePaymentMethod: false));
    } else {
      emit(LoanShowPaymentMethodTextFieldState(isVisiblePaymentMethod: true));
    }
  }

  FutureOr<void> _onLoanGetAllFieldsMandatoryEvent(
      LoanGetAllFieldsMandatoryEvent event, Emitter<LoansState> emit) async {
    emit(LoansLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestTypeId: event.requestTypeId, requestData: event.requestData);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(LoanGetAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(LoanGetAllFieldsMandatoryErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onLoanCalculateInCaseLoanEvent(
      LoanCalculateInCaseLoanEvent event, Emitter<LoansState> emit) async {
    DataState dataState = await _calculateInCaseLoanUseCase(
        request: CalculateInCaseLoanRequest(
      toDate: event.requestedDate,
      totalAmount:
          double.parse(event.loansController.loanTotalAmount.text).toInt(),
      isByInstallmentAmount: event.isByCurrentBalance,
      installements: event.loansController.installments.text.contains('.')
          ? (double.parse(event.loansController.installments.text)).round()
          : int.parse(event.loansController.installments.text),
      loanStartDate: event.startDate,
    ));
    if (dataState
        is DataSuccess<TalentLinkResponse<RemoteCalculateInCaseLoan>>) {
      InsertLoanRequest insertLoanRequest = InsertLoanRequest(
          id: 0,
          companyId: 4,
          employeeId: 2220,
          loanTypeId: event.typeId,
          loanRequestedDate: event.requestedDate,
          loanRequestedAmount:
              int.parse(event.loansController.loanRequestedAmount.text),
          profitRate: int.parse(event.loansController.profitRate.text),
          loanTotalAmount:
              double.parse(event.loansController.loanTotalAmount.text).toInt(),
          paymentStartMonth: 1,
          paymentStartYear: 2023,
          isByInstallmentAmount: event.isByCurrentBalance,
          installments: event.loansController.installments.text.contains('.')
              ? (double.parse(event.loansController.installments.text)).round()
              : int.parse(event.loansController.installments.text),
          isByPayroll: event.isPayroll,
          paymentMethodId: event.paymentMethodId,
          salaryDeductionPercentage: 10,
          isClosed: 0,
          remarks: event.loansController.remarks.text,
          indemnityServiceDays: 5,
          indemnityDays: 1,
          indemnityAmount: 10,
          basicSalaryAmount: 679,
          allowancesAmount: 679,
          transactionStatusId: 1,
          workFlowId: 0,
          noOfDigits: 1,
          currencyCode: "USD");
      DataState dataState = await _insertLoanUseCase.call(
          request: insertLoanRequest, file: File(event.file));
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(InsertLoanSuccessState(
            successMassage: dataState.data!.responseMessage.toString()));
      } else {
        emit(InsertLoanErrorState(errorMassage: dataState.toString()));
      }
    } else {
      emit(LoanCalculateInCaseLoanErrorState(
          errorMassage: dataState.error!.message.toString()));
    }
  }
}
