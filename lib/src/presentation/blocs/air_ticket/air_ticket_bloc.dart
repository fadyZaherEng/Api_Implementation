import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/utils/validation/air_ticket_validator.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/air_ticket_validation_use_case.dart';

part 'air_ticket_event.dart';

part 'air_ticket_state.dart';

class AirTicketBloc extends Bloc<AirTicketEvent, AirTicketState> {
  final AirTicketValidationUseCase _airTicketValidationUseCase;

  AirTicketBloc(this._airTicketValidationUseCase)
      : super(AirTicketInitialState()) {
    on<AirTicketBackEvent>(_onAirTicketBackEvent);
    on<AirTicketOpenPaymentMethodBottomSheetEvent>(
        _onAirTicketOpenPaymentMethodBottomSheetEvent);
    on<AirTicketSelectPaymentMethodEvent>(_onAirTicketSelectPaymentMethodEvent);
    on<AirTicketSubmitEvent>(_onAirTicketSubmitEvent);
    on<AirTicketShowPaymentMethodTextFieldEvent>(
        _onAirTicketShowPaymentMethodTextFieldEvent);
    on<AirTicketValidationPaymentMethodEvent>(
        _onAirTicketValidationPaymentMethodEvent);
  }

  final List<RequestPaymentMethod> airTicketPaymentMethods = [
    RequestPaymentMethod(id: 1, name: "Payment Method 1"),
    RequestPaymentMethod(id: 2, name: "Payment Method 2"),
    RequestPaymentMethod(id: 3, name: "Payment Method 3"),
  ];

  FutureOr<void> _onAirTicketBackEvent(
      AirTicketBackEvent event, Emitter<AirTicketState> emit) {
    emit(AirTicketBackState());
  }

  FutureOr<void> _onAirTicketOpenPaymentMethodBottomSheetEvent(
      AirTicketOpenPaymentMethodBottomSheetEvent event,
      Emitter<AirTicketState> emit) {
    emit(AirTicketOpenPaymentMethodBottomSheetState());
  }

  FutureOr<void> _onAirTicketSelectPaymentMethodEvent(
      AirTicketSelectPaymentMethodEvent event, Emitter<AirTicketState> emit) {
    emit(AirTicketSelectPaymentMethodState(paymentMethod: event.paymentMethod));
    add(AirTicketValidationPaymentMethodEvent(value: event.paymentMethod.name));
  }

  FutureOr<void> _onAirTicketSubmitEvent(
      AirTicketSubmitEvent event, Emitter<AirTicketState> emit) async {
    if (event.isVisiblePaymentMethod == true) {
      AirTicketValidationState airTicketValidationState =
          _airTicketValidationUseCase
              .validatePaymentMethod(event.paymentMethod);
      if (airTicketValidationState == AirTicketValidationState.valid) {
        emit(AirTicketLoadingState());
        await Future.delayed(const Duration(seconds: 2));
        emit(AirTicketSubmitSuccessState(successMassage: S.current.success));
      } else {
        emit(AirTicketValidationPaymentMethodEmptyState(
          validationMassage: S.current.thisFieldIsRequired,
        ));
      }
    } else {
      emit(AirTicketLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(AirTicketSubmitSuccessState(successMassage: S.current.success));
    }
  }

  FutureOr<void> _onAirTicketShowPaymentMethodTextFieldEvent(
      AirTicketShowPaymentMethodTextFieldEvent event,
      Emitter<AirTicketState> emit) {
    if (event.singleSelectionModel.id == 1) {
      emit(AirTicketShowPaymentMethodTextFieldState(
          visiblePaymentMethod: false));
    } else {
      emit(
          AirTicketShowPaymentMethodTextFieldState(visiblePaymentMethod: true));
    }
  }

  FutureOr<void> _onAirTicketValidationPaymentMethodEvent(
      AirTicketValidationPaymentMethodEvent event,
      Emitter<AirTicketState> emit) {
    AirTicketValidationState airTicketValidationState =
        _airTicketValidationUseCase.validatePaymentMethod(event.value);
    if (airTicketValidationState == AirTicketValidationState.valid) {
      emit(AirTicketValidationPaymentMethodValidState());
    } else {
      emit(AirTicketValidationPaymentMethodEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }
}
