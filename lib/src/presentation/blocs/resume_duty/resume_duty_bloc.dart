import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/resume_duty_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/resume_duty/resume_duty.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_data_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/resume_duty_use_case.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';

part 'resume_duty_event.dart';

part 'resume_duty_state.dart';

class ResumeDutyBloc extends Bloc<ResumeDutyEvent, ResumeDutyState> {
  final ResumeDutyValidationUseCase _resumeDutyValidationUseCase;
  final GetResumeDutyReferenceTypesUseCase _getResumeDutyReferenceTypesUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  final GetResumeDutyReferenceDataUseCase _getResumeDutyReferenceDataUseCase;

  ResumeDutyBloc(
    this._resumeDutyValidationUseCase,
    this._getResumeDutyReferenceTypesUseCase,
    this._getPaymentMethodUseCase,
    this._getResumeDutyReferenceDataUseCase,
  ) : super(ResumeDutyInitialState()) {
    on<ResumeDutyBackEvent>(_onResumeDutyBackEvent);
    on<ResumeDutyOpenReferenceTypeBottomSheetEvent>(
        _onResumeDutyOpenReferenceTypeBottomSheetState);
    on<ResumeDutyOpenReferenceDataBottomSheetEvent>(
        _onResumeDutyOpenReferenceDataBottomSheetEvent);
    on<ResumeDutyOpenPaymentMethodBottomSheetEvent>(
        _onResumeDutyOpenPaymentMethodBottomSheetEvent);
    on<ResumeDutySelectReferenceTypeEvent>(
        _onResumeDutySelectReferenceTypeEvent);
    on<ResumeDutySelectReferenceDataEvent>(
        _onResumeDutySelectReferenceDataEvent);
    on<ResumeDutySelectPaymentMethodEvent>(
        _onResumeDutySelectPaymentMethodEvent);
    on<ResumeDutyOpenUploadFileBottomSheetEvent>(
        _onResumeDutyOpenUploadFileBottomSheetEvent);
    on<ResumeDutyOpenCameraEvent>(_onResumeDutyOpenCameraEvent);
    on<ResumeDutyOpenGalleryEvent>(_onResumeDutyOpenGalleryEvent);
    on<ResumeDutyOpenFileEvent>(_onResumeDutyOpenFileEvent);
    on<ResumeDutySelectFileEvent>(_onResumeDutySelectFileEvent);
    on<ResumeDutyDeleteFileEvent>(_onResumeDutyDeleteFileEvent);
    on<ResumeDutySubmitEvent>(_onResumeDutySubmitEvent);
    on<ResumeDutyValidationReferenceTypeEvent>(
        _onResumeDutyValidationReferenceTypeEvent);
    on<ResumeDutyValidationReferenceDataEvent>(
        _onResumeDutyValidationReferenceDataEvent);
    on<ResumeDutyValidationPaymentMethodEvent>(
        _onResumeDutyValidationPaymentMethodEvent);
    on<ResumeDutyValidationActualResumeDutyDateEvent>(
        _onResumeDutyValidationActualResumeDutyDateEvent);
    on<ResumeDutyValidationRemarksEvent>(_onResumeDutyValidationRemarksEvent);
    on<ResumeDutyValidationFileEvent>(_onResumeDutyValidationFileEvent);
    on<GetResumeDutyReferenceTypesEvent>(_onGetResumeDutyReferenceTypesEvent);
    on<GetResumeDutyPaymentMethodEvent>(_onGetResumeDutyPaymentMethodEvent);
    on<GetResumeDutyReferenceDataEvent>(_onGetResumeDutyReferenceDataEvent);
    on<ResumeDutyShowPaymentMethodTextFieldEvent>(
        _onResumeDutyShowPaymentMethodTextFieldEvent);
  }

  List<RequestType> _referenceTypes = [];
  List<RequestPaymentMethod> _paymentMethods = [];

  List<ResumeDuty> resumeDuties = [
    ResumeDuty(id: 1, isMandatory: true, isVisible: true),
    ResumeDuty(id: 2, isMandatory: true, isVisible: true),
  ];

  List<RequestType> _referencesData = [
    RequestType(id: 1, name: "Deference Data 1"),
    RequestType(id: 2, name: "Deference Data 2"),
    RequestType(id: 3, name: "Deference Data 3"),
  ];

  FutureOr<void> _onResumeDutyBackEvent(
      ResumeDutyBackEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyBackState());
  }

  FutureOr<void> _onResumeDutyOpenReferenceTypeBottomSheetState(
      ResumeDutyOpenReferenceTypeBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenReferenceTypeBottomSheetState());
  }

  FutureOr<void> _onResumeDutySelectReferenceTypeEvent(
      ResumeDutySelectReferenceTypeEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectReferenceTypeState(requestType: event.requestType));
    add(ResumeDutyValidationReferenceTypeEvent(value: event.requestType.name));
    add(GetResumeDutyReferenceDataEvent(
        isByPayroll: 1, resumeDutyReferenceType: event.requestType.id));
  }

  FutureOr<void> _onResumeDutyOpenReferenceDataBottomSheetEvent(
      ResumeDutyOpenReferenceDataBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenReferenceDataBottomSheetState());
  }

  FutureOr<void> _onResumeDutySelectReferenceDataEvent(
      ResumeDutySelectReferenceDataEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectReferenceDataState(requestType: event.requestType));
    add(ResumeDutyValidationReferenceDataEvent(value: event.requestType.name));
  }

  FutureOr<void> _onResumeDutyOpenPaymentMethodBottomSheetEvent(
      ResumeDutyOpenPaymentMethodBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onResumeDutySelectPaymentMethodEvent(
      ResumeDutySelectPaymentMethodEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectPaymentMethodState(requestType: event.requestType));
    add(ResumeDutyValidationPaymentMethodEvent(
        value: event.requestType.name,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod));
  }

  FutureOr<void> _onResumeDutyOpenUploadFileBottomSheetEvent(
      ResumeDutyOpenUploadFileBottomSheetEvent event,
      Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenUploadFileBottomSheetState(
      isMandatory: event.isMandatory,
    ));
  }

  FutureOr<void> _onResumeDutyOpenCameraEvent(
      ResumeDutyOpenCameraEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutyOpenGalleryEvent(
      ResumeDutyOpenGalleryEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutyOpenFileEvent(
      ResumeDutyOpenFileEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutySelectFileEvent(
      ResumeDutySelectFileEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutySelectFileState(filePath: event.filePath));
    add(ResumeDutyValidationFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutyDeleteFileEvent(
      ResumeDutyDeleteFileEvent event, Emitter<ResumeDutyState> emit) {
    emit(ResumeDutyDeleteFileState(filePath: ''));
    add(ResumeDutyValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onResumeDutySubmitEvent(
      ResumeDutySubmitEvent event, Emitter<ResumeDutyState> emit) async {
    final validationsState = _resumeDutyValidationUseCase.validateFormUseCase(
        file: event.file,
        resumeDuties: event.resumeDuties,
        actualResumeDutyData: event.actualResumeDutyData,
        resumeDutyController: event.resumeDutyController,
        isVisiblePaymentMethod: event.isVisiblePaymentMethod);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == ResumeDutyValidationState.referenceTypeEmpty) {
          emit(ResumeDutyValidationReferenceTypeEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.referenceDataEmpty) {
          emit(ResumeDutyValidationReferenceDataEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.paymentMethodEmpty) {
          emit(ResumeDutyValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            ResumeDutyValidationState.actualResumeDutyDateEmpty) {
          emit(ResumeDutyValidationActualResumeDutyDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.remarksEmpty) {
          emit(ResumeDutyValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ResumeDutyValidationState.fileEmpty) {
          emit(ResumeDutyValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(ResumeDutyLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(ResumeDutySubmitSuccessState(successMassage: S.current.success));
    }
  }

  FutureOr<void> _onResumeDutyValidationReferenceTypeEvent(
      ResumeDutyValidationReferenceTypeEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateReferenceType(event.value);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationReferenceTypeValidState());
    } else {
      emit(ResumeDutyValidationReferenceTypeEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationReferenceDataEvent(
      ResumeDutyValidationReferenceDataEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateReferenceData(event.value);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationReferenceDataValidState());
    } else {
      emit(ResumeDutyValidationReferenceDataEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationPaymentMethodEvent(
      ResumeDutyValidationPaymentMethodEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validatePaymentMethod(
            event.value, event.isVisiblePaymentMethod);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationPaymentMethodValidState());
    } else {
      emit(ResumeDutyValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationActualResumeDutyDateEvent(
      ResumeDutyValidationActualResumeDutyDateEvent event,
      Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateActualResumeDutyDate(event.value);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationActualResumeDutyDateValidState());
    } else {
      emit(ResumeDutyValidationActualResumeDutyDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationRemarksEvent(
      ResumeDutyValidationRemarksEvent event, Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationRemarksValidState());
    } else {
      emit(ResumeDutyValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onResumeDutyValidationFileEvent(
      ResumeDutyValidationFileEvent event, Emitter<ResumeDutyState> emit) {
    ResumeDutyValidationState leaveValidationState =
        _resumeDutyValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (leaveValidationState == ResumeDutyValidationState.valid) {
      emit(ResumeDutyValidationFileValidState());
    } else {
      emit(ResumeDutyValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetResumeDutyReferenceTypesEvent(
      GetResumeDutyReferenceTypesEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getResumeDutyReferenceTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _referenceTypes = dataState.data!;
      emit(GetResumeDutyReferenceTypesSuccessState(
          requestTypes: _referenceTypes));
    } else {
      emit(GetResumeDutyReferenceTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetResumeDutyPaymentMethodEvent(
      GetResumeDutyPaymentMethodEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _paymentMethods = dataState.data!;
      emit(GetResumeDutyPaymentMethodSuccessState(
          paymentMethods: _paymentMethods));
    } else {
      emit(GetResumeDutyPaymentMethodsErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetResumeDutyReferenceDataEvent(
      GetResumeDutyReferenceDataEvent event,
      Emitter<ResumeDutyState> emit) async {
    emit(ResumeDutyLoadingState());
    DataState dataState = await _getResumeDutyReferenceDataUseCase(
        request: ResumeDutyReferenceDataRequest(
            isByPayroll: event.isByPayroll,
            resumeDutyReferenceType: event.isByPayroll));
    if (dataState is DataSuccess<List<RequestType>>) {
      _referencesData = dataState.data!;
      emit(GetResumeDutyReferenceDataSuccessState(
          requestTypes: _referencesData));
    } else {
      emit(GetResumeDutyReferenceDataErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onResumeDutyShowPaymentMethodTextFieldEvent(
      ResumeDutyShowPaymentMethodTextFieldEvent event,
      Emitter<ResumeDutyState> emit) {
    if (event.selectionModel.id == 0) {
      emit(ResumeDutyShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: false));
    } else {
      emit(ResumeDutyShowPaymentMethodTextFieldState(
          isVisiblePaymentMethod: true));
    }
  }
}
