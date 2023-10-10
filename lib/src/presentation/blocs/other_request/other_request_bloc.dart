import 'dart:async';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/other_request_validator.dart';
import 'package:talent_link/src/domain/entities/other_rquest/other_rquest.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/other_request/get_other_request_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/other_request_validation_use_case.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_controller.dart';

part 'other_request_event.dart';

part 'other_request_state.dart';

class OtherRequestBloc extends Bloc<OtherRequestEvent, OtherRequestState> {
  final OtherRequestValidationUseCase _otherRequestValidationUseCase;
  final GetOtherRequestTypesUseCase _getOtherRequestTypesUseCase;

  OtherRequestBloc(
      this._otherRequestValidationUseCase, this._getOtherRequestTypesUseCase)
      : super(OtherRequestInitialState()) {
    on<OtherRequestBackEvent>(_onOtherRequestBackEvent);
    on<OtherRequestOpenRequestBottomSheetEvent>(
        _onOtherRequestOpenRequestBottomSheetEvent);
    on<OtherRequestSelectRequestEvent>(_onOtherRequestSelectRequestEvent);
    on<OtherRequestOpenUploadFileBottomSheetEvent>(
        _onOtherRequestOpenUploadFileBottomSheetEvent);
    on<OtherRequestOpenCameraEvent>(_onOtherRequestOpenCameraEvent);
    on<OtherRequestOpenGalleryEvent>(_onOtherRequestOpenGalleryEvent);
    on<OtherRequestOpenFileEvent>(_onOtherRequestOpenFileEvent);
    on<OtherRequestSelectFileEvent>(_onOtherRequestSelectFileEvent);
    on<OtherRequestDeleteFileEvent>(_onOtherRequestDeleteFileEvent);
    on<OtherRequestSubmitEvent>(_onOtherRequestSubmitEvent);
    on<OtherRequestValidationRequestEvent>(
        _onOtherRequestValidationRequestEvent);
    on<OtherRequestValidationRequestDateEvent>(
        _onOtherRequestValidationRequestDateEvent);
    on<OtherRequestValidationRemarkEvent>(_onOtherRequestValidationRemarkEvent);
    on<OtherRequestValidationNotesEvent>(_onOtherRequestValidationNotesEvent);
    on<OtherRequestValidationFileEvent>(_onOtherRequestValidationFileEvent);
    on<GetOtherRequestTypesEvent>(_onGetOtherRequestTypesEvent);
  }

  List<OtherRequest> otherRequests = [
    OtherRequest(id: 1, isMandatory: true, isVisible: true),
    OtherRequest(id: 2, isMandatory: true, isVisible: true),
    OtherRequest(id: 3, isMandatory: true, isVisible: true),
  ];
  List<RequestType> _otherRequestTypes = [];

  FutureOr<void> _onOtherRequestBackEvent(
      OtherRequestBackEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestBackState());
  }

  FutureOr<void> _onOtherRequestOpenRequestBottomSheetEvent(
      OtherRequestOpenRequestBottomSheetEvent event,
      Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenRequestBottomSheetState());
  }

  FutureOr<void> _onOtherRequestSelectRequestEvent(
      OtherRequestSelectRequestEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestSelectRequestState(requestType: event.requestType));
    add(OtherRequestValidationRequestEvent(value: event.requestType.name));
  }

  FutureOr<void> _onOtherRequestOpenUploadFileBottomSheetEvent(
      OtherRequestOpenUploadFileBottomSheetEvent event,
      Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenUploadFileBottomSheetState(
        isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestOpenCameraEvent(
      OtherRequestOpenCameraEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenCameraState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestOpenGalleryEvent(
      OtherRequestOpenGalleryEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenGalleryState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestOpenFileEvent(
      OtherRequestOpenFileEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestOpenFileState(isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestSelectFileEvent(
      OtherRequestSelectFileEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestSelectFileState(filePath: event.filePath));
    add(OtherRequestValidationFileEvent(
        value: event.filePath, isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestDeleteFileEvent(
      OtherRequestDeleteFileEvent event, Emitter<OtherRequestState> emit) {
    emit(OtherRequestDeleteFileState(filePath: ''));
    add(OtherRequestValidationFileEvent(
        value: '', isMandatory: event.isMandatory));
  }

  FutureOr<void> _onOtherRequestSubmitEvent(
      OtherRequestSubmitEvent event, Emitter<OtherRequestState> emit) async {
    final validationsState = _otherRequestValidationUseCase.validateFormUseCase(
        file: event.file,
        otherRequests: event.otherRequests,
        requestedDate: event.requestedDate,
        otherRequestController: event.otherRequestController);

    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == OtherRequestValidationState.requestEmpty) {
          emit(OtherRequestValidationRequestEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.requestDateEmpty) {
          emit(OtherRequestValidationRequestDateEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.remarksEmpty) {
          emit(OtherRequestValidationRemarksEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.notesEmpty) {
          emit(OtherRequestValidationNotesEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        } else if (element == OtherRequestValidationState.fileEmpty) {
          emit(OtherRequestValidationFileEmptyState(
            validationMassage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(OtherRequestLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(OtherRequestSubmitSuccessState(successMassage: S.current.success));
    }
  }

  FutureOr<void> _onOtherRequestValidationRequestEvent(
      OtherRequestValidationRequestEvent event,
      Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateRequest(event.value);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationRequestValidState());
    } else {
      emit(OtherRequestValidationRequestEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationRequestDateEvent(
      OtherRequestValidationRequestDateEvent event,
      Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateRequestDate(event.value);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationRequestDateValidState());
    } else {
      emit(OtherRequestValidationRequestDateEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationRemarkEvent(
      OtherRequestValidationRemarkEvent event,
      Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateRemarks(
            event.value, event.isMandatory);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationRemarksValidState());
    } else {
      emit(OtherRequestValidationRemarksEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationNotesEvent(
      OtherRequestValidationNotesEvent event, Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateNotes(
            event.value, event.isMandatory);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationNotesValidState());
    } else {
      emit(OtherRequestValidationNotesEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onOtherRequestValidationFileEvent(
      OtherRequestValidationFileEvent event, Emitter<OtherRequestState> emit) {
    OtherRequestValidationState otherRequestValidationState =
        _otherRequestValidationUseCase.validateFile(
            event.value, event.isMandatory);
    if (otherRequestValidationState == OtherRequestValidationState.valid) {
      emit(OtherRequestValidationFileValidState());
    } else {
      emit(OtherRequestValidationFileEmptyState(
        validationMassage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetOtherRequestTypesEvent(
      GetOtherRequestTypesEvent event, Emitter<OtherRequestState> emit) async {
    emit(OtherRequestLoadingState());
    DataState dataState = await _getOtherRequestTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _otherRequestTypes = dataState.data!;
      emit(GetOtherRequestTypesSuccessState(
          otherRequestTypes: _otherRequestTypes));
    } else {
      emit(GetOtherRequestTypesErrorState(
          errorMassage: dataState.error!.error.toString()));
    }
  }
}
