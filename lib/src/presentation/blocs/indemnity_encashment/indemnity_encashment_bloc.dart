import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/indemnity_encashment_validator.dart';
import 'package:talent_link/src/domain/entities/indemnity_encashment/indemnity_encashment.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/indemnity_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';

part 'indemnity_encashment_event.dart';

part 'indemnity_encashment_state.dart';

class IndemnityEncashmentBloc
    extends Bloc<IndemnityEncashmentEvent, IndemnityEncashmentState> {
  final IndemnityEncashmentValidationUseCase
      _indemnityEncashmentValidationUseCase;
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;

  IndemnityEncashmentBloc(
      this._indemnityEncashmentValidationUseCase, this._getPaymentMethodUseCase)
      : super(IndemnityEncashmentInitialState()) {
    on<IndemnityEncashmentBackEvent>(_onIndemnityEncashmentBackEvent);
    on<IndemnityEncashmentOpenPaymentMethodBottomSheetEvent>(
        _onIndemnityEncashmentOpenPaymentMethodBottomSheetEvent);
    on<IndemnityEncashmentValidationRemarksEvent>(
        _onIndemnityEncashmentValidationRemarksEvent);
    on<IndemnityEncashmentDeleteFileEvent>(
        _onIndemnityEncashmentDeleteFileEvent);
    on<IndemnityEncashmentOpenUploadFileEvent>(
        _onIndemnityEncashmentOpenUploadFileEvent);
    on<IndemnityEncashmentValidationRequestedDaysEvent>(
        _onIndemnityEncashmentValidationRequestedDaysEvent);
    on<IndemnityEncashmentValidationPaymentMonthEvent>(
        _onIndemnityEncashmentValidationPaymentMonthEvent);
    on<IndemnityEncashmentValidationRequestedDateEvent>(
        _onIndemnityEncashmentValidationRequestedDateEvent);
    on<IndemnityEncashmentSelectFileEvent>(
        _onIndemnityEncashmentSelectFileEvent);
    on<IndemnityEncashmentSelectPaymentMethodEvent>(
        _onIndemnityEncashmentSelectPaymentMethodEvent);
    on<IndemnityEncashmentOpenCameraEvent>(
        _onIndemnityEncashmentOpenCameraEvent);
    on<IndemnityEncashmentOpenGalleryEvent>(
        _onIndemnityEncashmentOpenGalleryEvent);
    on<IndemnityEncashmentOpenFileEvent>(_onIndemnityEncashmentOpenFileEvent);
    on<IndemnityEncashmentSubmitEvent>(_onIndemnityEncashmentSubmitEvent);
    on<IndemnityEncashmentValidationPaymentMethodEvent>(
        _onIndemnityEncashmentValidationPaymentMethodEvent);
    on<IndemnityEncashmentValidationFileEvent>(
        _onIndemnityEncashmentValidationFileEvent);
    on<IndemnityEncashmentGetPaymentMethodEvent>(
        _onIndemnityEncashmentGetPaymentMethodEvent);
  }

  final List<IndemnityEncashment> indemnitiesEncashment = [
    IndemnityEncashment(id: 1, isMandatory: true, isVisible: true),
    IndemnityEncashment(id: 2, isMandatory: true, isVisible: true),
  ];
  List<RequestPaymentMethod> _indemnityEncashmentPaymentMethods = [];

  FutureOr<void> _onIndemnityEncashmentBackEvent(
      IndemnityEncashmentBackEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentBackState());
  }

  FutureOr<void> _onIndemnityEncashmentOpenPaymentMethodBottomSheetEvent(
      IndemnityEncashmentOpenPaymentMethodBottomSheetEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onIndemnityEncashmentValidationRemarksEvent(
      IndemnityEncashmentValidationRemarksEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationRemarksValidState());
    } else {
      emit(IndemnityEncashmentValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentDeleteFileEvent(
      IndemnityEncashmentDeleteFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentDeleteFileState(
      value: '',
    ));
    add(IndemnityEncashmentValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentOpenUploadFileEvent(
      IndemnityEncashmentOpenUploadFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(
        IndemnityEncashmentOpenUploadFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentValidationRequestedDaysEvent(
      IndemnityEncashmentValidationRequestedDaysEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase
            .validateRequestedDays(event.value);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationRequestedDaysValidState());
    } else if (leaveValidationState ==
        IndemnityEncashmentValidationState.requestedDaysNotValid) {
      emit(IndemnityEncashmentValidationRequestedDaysNotValidState(
        validationMassage: S.current.maximumDaysIs80,
      ));
    } else {
      emit(IndemnityEncashmentValidationRequestedDaysEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationPaymentMonthEvent(
      IndemnityEncashmentValidationPaymentMonthEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validatePaymentMonth(event.value);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationPaymentMonthValidState());
    } else {
      emit(IndemnityEncashmentValidationPaymentMonthEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationRequestedDateEvent(
      IndemnityEncashmentValidationRequestedDateEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateRequestDate(event.value);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationRequestedDateValidState());
    } else if (leaveValidationState ==
        IndemnityEncashmentValidationState.requestedDaysNotValid) {
      emit(IndemnityEncashmentValidationRequestedDaysNotValidState(
        validationMassage: S.current.maximumDaysIs80,
      ));
    } else {
      emit(IndemnityEncashmentValidationRequestedDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentSelectFileEvent(
      IndemnityEncashmentSelectFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentSelectFileState(value: event.value));
    add(IndemnityEncashmentValidationFileEvent(
        value: event.value, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentSelectPaymentMethodEvent(
      IndemnityEncashmentSelectPaymentMethodEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentSelectPaymentMethodState(value: event.value));
  }

  FutureOr<void> _onIndemnityEncashmentOpenCameraEvent(
      IndemnityEncashmentOpenCameraEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentOpenGalleryEvent(
      IndemnityEncashmentOpenGalleryEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentOpenFileEvent(
      IndemnityEncashmentOpenFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    emit(IndemnityEncashmentOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onIndemnityEncashmentSubmitEvent(
      IndemnityEncashmentSubmitEvent event,
      Emitter<IndemnityEncashmentState> emit) async {
    final validationsState =
        _indemnityEncashmentValidationUseCase.validateFormUseCase(
      file: event.file,
      requestedDate: event.requestedDate,
      paymentMonth: event.paymentMonth,
      indemnitiesEncashment: event.indemnitiesEncashment,
      indemnityEncashmentController: event.indemnityEncashmentController,
    );
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == IndemnityEncashmentValidationState.requestDateEmpty) {
          emit(IndemnityEncashmentValidationRequestedDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.requestedDaysEmpty) {
          emit(IndemnityEncashmentValidationRequestedDaysEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.requestedDaysNotValid) {
          emit(IndemnityEncashmentValidationRequestedDaysNotValidState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.paymentMonthEmpty) {
          emit(IndemnityEncashmentValidationPaymentMonthEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            IndemnityEncashmentValidationState.paymentMethodEmpty) {
          emit(IndemnityEncashmentValidationPaymentMethodEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == IndemnityEncashmentValidationState.remarksEmpty) {
          emit(IndemnityEncashmentValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == IndemnityEncashmentValidationState.fileEmpty) {
          emit(IndemnityEncashmentValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(IndemnityEncashmentLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(IndemnityEncashmentSubmitSuccessState(
          successMassage: S.current.success));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationPaymentMethodEvent(
      IndemnityEncashmentValidationPaymentMethodEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase
            .validatePaymentMethod(event.value);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationPaymentMethodValidState());
    } else {
      emit(IndemnityEncashmentValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentValidationFileEvent(
      IndemnityEncashmentValidationFileEvent event,
      Emitter<IndemnityEncashmentState> emit) {
    IndemnityEncashmentValidationState leaveValidationState =
        _indemnityEncashmentValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (leaveValidationState == IndemnityEncashmentValidationState.valid) {
      emit(IndemnityEncashmentValidationFileValidState());
    } else {
      emit(IndemnityEncashmentValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onIndemnityEncashmentGetPaymentMethodEvent(
      IndemnityEncashmentGetPaymentMethodEvent event,
      Emitter<IndemnityEncashmentState> emit) async {
    emit(IndemnityEncashmentLoadingState());
    DataState dataState = await _getPaymentMethodUseCase();
    if (dataState is DataSuccess<List<RequestPaymentMethod>>) {
      _indemnityEncashmentPaymentMethods = dataState.data!;
      emit(IndemnityEncashmentGetPaymentMethodSuccessState(
          paymentMethods: _indemnityEncashmentPaymentMethods));
    } else {
      emit(IndemnityEncashmentGetPaymentMethodErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }
}
