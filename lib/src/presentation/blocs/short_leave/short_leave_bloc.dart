import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/short_leave_validator.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/calculate_in_case_short_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/get_short_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/short_leave_validation_use_case.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';

part 'short_leave_event.dart';

part 'short_leave_state.dart';

class ShortLeaveBloc extends Bloc<ShortLeaveEvent, ShortLeaveState> {
  final GetShortLeaveTypesUseCase _getShortLeaveTypesUseCase;
  final ShortLeaveValidationUseCase _shortLeaveValidationUseCase;
  final GetAllFieldsMandatoryUseCase _getAllFieldsMandatoryUseCase;
  final CalculateInCaseShortLeaveUseCase _calculateInCaseShortLeaveUseCase;

  ShortLeaveBloc(
    this._shortLeaveValidationUseCase,
    this._getShortLeaveTypesUseCase,
    this._getAllFieldsMandatoryUseCase,
    this._calculateInCaseShortLeaveUseCase,
  ) : super(ShortLeaveInitialState()) {
    on<ShortLeaveBackEvent>(_onShortLeaveBackEvent);
    on<OpenTypeBottomSheetEvent>(_onOpenTypeBottomSheetEvent);
    on<SelectShortLeaveTypeEvent>(_onSelectShortLeaveTypeEvent);
    on<OpenUploadFileBottomSheetEvent>(_onOpenUploadFileBottomSheetEvent);
    on<ShortLeaveOpenCameraEvent>(_onShortLeaveOpenCameraEvent);
    on<ShortLeaveOpenGalleryEvent>(_onShortLeaveOpenGalleryEvent);
    on<ShortLeaveOpenFileEvent>(_onShortLeaveOpenFileEvent);
    on<ShortLeaveSelectFileEvent>(_onShortLeaveSelectFileEvent);
    on<ShortLeaveDeleteFileEvent>(_onShortLeaveDeleteFileEvent);
    on<ShortLeaveSubmitEvent>(_onShortLeaveSubmitEvent);
    on<ValidateShortLeaveTypeEvent>(_onValidateShortLeaveTypeEvent);
    on<ValidateShortLeaveDateEvent>(_onValidateShortLeaveDateEvent);
    on<ValidateShortLeaveStartTimeEvent>(_onValidateShortLeaveStartTimeEvent);
    on<ValidateShortLeaveEndTimeEvent>(_onValidateShortLeaveEndTimeEvent);
    on<ValidateShortLeaveEndNumberOfMinutesEvent>(
        _onValidateShortLeaveEndNumberOfMinutesEvent);
    on<ValidateShortLeaveReferenceNameEvent>(
        _onValidateShortLeaveReferenceNameEvent);
    on<ValidateShortLeaveYearlyBalanceEvent>(
        _onValidateShortLeaveYearlyBalanceEvent);
    on<ValidateShortLeaveReasonsEvent>(_onValidateShortLeaveReasonsEvent);
    on<ValidateShortLeaveRemarksEvent>(_onValidateShortLeaveRemarksEvent);
    on<ValidateShortLeaveFileEvent>(_onValidateShortLeaveFileEvent);
    on<GetShortLeaveTypesEvent>(_onGetShortLeaveTypesEvent);
    on<GetAllFieldsMandatoryEvent>(_onGetAllFieldsMandatoryEvent);
  }

  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestType> shortLeaveTypes = [];

  FutureOr<void> _onShortLeaveBackEvent(
      ShortLeaveBackEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveBackState());
  }

  FutureOr<void> _onOpenTypeBottomSheetEvent(
      OpenTypeBottomSheetEvent event, Emitter<ShortLeaveState> emit) {
    emit(OpenTypeBottomSheetState());
  }

  FutureOr<void> _onSelectShortLeaveTypeEvent(
      SelectShortLeaveTypeEvent event, Emitter<ShortLeaveState> emit) {
    emit(SelectShortLeaveTypeState(
      shortLeaveType: event.shortLeaveType,
    ));
    add(ValidateShortLeaveTypeEvent(value: event.shortLeaveType.name));
  }

  FutureOr<void> _onOpenUploadFileBottomSheetEvent(
      OpenUploadFileBottomSheetEvent event, Emitter<ShortLeaveState> emit) {
    emit(OpenUploadFileBottomSheetState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveOpenCameraEvent(
      ShortLeaveOpenCameraEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveOpenGalleryEvent(
      ShortLeaveOpenGalleryEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveOpenFileEvent(
      ShortLeaveOpenFileEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveSelectFileEvent(
      ShortLeaveSelectFileEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveSelectFileState(filePath: event.filePath));
    add(ValidateShortLeaveFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveDeleteFileEvent(
      ShortLeaveDeleteFileEvent event, Emitter<ShortLeaveState> emit) {
    emit(ShortLeaveDeleteFileState(filePath: ''));
    add(ValidateShortLeaveFileEvent(value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onShortLeaveSubmitEvent(
      ShortLeaveSubmitEvent event, Emitter<ShortLeaveState> emit) async {
    final validationsState = _shortLeaveValidationUseCase.validateFormUseCase(
        file: event.file,
        date: event.date,
        startTime: event.startTime,
        endTime: event.endTime,
        allFieldsMandatory: event.allFieldsMandatory,
        shortLeaveController: event.shortLeaveController);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == ShortLeaveValidationState.typeEmpty) {
          emit(ShortLeaveTypeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.dateEmpty) {
          emit(ShortLeaveDateEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.startTimeEmpty) {
          emit(ShortLeaveStartTimeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.endTimeEmpty) {
          emit(ShortLeaveEndTimeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            ShortLeaveValidationState.endNumberOfMinuteEmpty) {
          emit(ShortLeaveEndNumberOfMinuteEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.referenceNameEmpty) {
          emit(ShortLeaveReferenceNameEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.yearlyBalanceEmpty) {
          emit(ShortLeaveYearlyBalanceEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.leaveReasonsEmpty) {
          emit(ShortLeaveReasonsEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.remarksEmpty) {
          emit(ShortLeaveRemarksEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ShortLeaveValidationState.fileEmpty) {
          emit(ShortLeaveFileEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(ShortLeaveLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(ShortLeaveSubmitSuccessState(successMassage: S.current.success));
    }
  }

  FutureOr<void> _onValidateShortLeaveTypeEvent(
      ValidateShortLeaveTypeEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateType(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveTypeValidState());
    } else {
      emit(ShortLeaveTypeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveDateEvent(
      ValidateShortLeaveDateEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateDate(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveDateValidState());
    } else {
      emit(ShortLeaveDateEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveStartTimeEvent(
      ValidateShortLeaveStartTimeEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateStartTime(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveStartTimeValidState());
    } else {
      emit(ShortLeaveStartTimeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveEndTimeEvent(
      ValidateShortLeaveEndTimeEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateEndTime(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveEndTimeValidState());
    } else {
      emit(ShortLeaveEndTimeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveEndNumberOfMinutesEvent(
      ValidateShortLeaveEndNumberOfMinutesEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateEndNumberOfMinute(event.value);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveEndNumberOfMinuteValidState());
    } else {
      emit(ShortLeaveEndNumberOfMinuteEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveReferenceNameEvent(
      ValidateShortLeaveReferenceNameEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateReferenceName(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveReferenceNameValidState());
    } else {
      emit(ShortLeaveReferenceNameEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveYearlyBalanceEvent(
      ValidateShortLeaveYearlyBalanceEvent event,
      Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateYearlyBalance(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveYearlyBalanceValidState());
    } else {
      emit(ShortLeaveYearlyBalanceEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveReasonsEvent(
      ValidateShortLeaveReasonsEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateLeaveReasons(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveReasonsValidState());
    } else {
      emit(ShortLeaveReasonsEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveRemarksEvent(
      ValidateShortLeaveRemarksEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveRemarksValidState());
    } else {
      emit(ShortLeaveRemarksEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onValidateShortLeaveFileEvent(
      ValidateShortLeaveFileEvent event, Emitter<ShortLeaveState> emit) {
    ShortLeaveValidationState leaveValidationState =
        _shortLeaveValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (leaveValidationState == ShortLeaveValidationState.valid) {
      emit(ShortLeaveFileValidState());
    } else {
      emit(ShortLeaveFileEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetShortLeaveTypesEvent(
      GetShortLeaveTypesEvent event, Emitter<ShortLeaveState> emit) async {
    emit(ShortLeaveLoadingState());
    DataState dataState = await _getShortLeaveTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      shortLeaveTypes = dataState.data!;
      emit(GetShortLeaveTypesSuccessState(requestTypes: shortLeaveTypes));
    } else {
      emit(GetShortLeaveTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetAllFieldsMandatoryEvent(
      GetAllFieldsMandatoryEvent event, Emitter<ShortLeaveState> emit) async {
    emit(ShortLeaveLoadingState());
    DataState dataState = await _getAllFieldsMandatoryUseCase(
        requestData: event.requestData, requestTypeId: event.requestTypeId);
    if (dataState is DataSuccess<List<AllFieldsMandatory>>) {
      _allFieldsMandatory = dataState.data!;
      emit(GetAllFieldsMandatorySuccessState(
          allFieldsMandatory: _allFieldsMandatory));
    } else {
      emit(GetAllFieldsMandatoryErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }
}
