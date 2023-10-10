// ignore_for_file: depend_on_referenced_packages, avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/android_date_picker.dart';
import 'package:talent_link/src/core/utils/ios_date_picker.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/domain/usecase/payslip/get_employer_id_usecase.dart';
import 'package:talent_link/src/domain/usecase/payslip/payslip_use_case.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_event.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_state.dart';

class PayslipBloc extends Bloc<PayslipEvent, PayslipState> {
  final PayslipUseCase _payslipUseCase;
  final GetEmployerIdUseCase _getEmployerIdUseCase;

  PayslipBloc(
    this._payslipUseCase,
    this._getEmployerIdUseCase,
  ) : super(PayslipInitialState()) {
    on<PayslipGetDataEvent>(_onPayslipGetDataEvent);
    on<PayslipLeftArrowEvent>(_onPayslipLeftArrowEvent);
    on<PayslipRightArrowEvent>(_onPayslipRightArrowEvent);
    on<PayslipSelectDateEvent>(_onPayslipSelectDateEvent);
  }

  //get date from api
  PayslipModel? payslipModel;

  Future<void> _onPayslipGetDataEvent(
      PayslipGetDataEvent event, Emitter<PayslipState> emit) async {
    DataState dataState = await _payslipUseCase.call(
      employeeId: (await _getEmployerIdUseCase.call()) ?? 2220,
      month: event.month,
      year: event.year,
    );
    if (dataState is DataSuccess<PayslipModel>) {
      payslipModel = dataState.data;
      emit(PayslipGetDataSuccessState(payslipModel: payslipModel));
    } else {
      emit(PayslipGetDataErrorState(
          errorMSG: dataState.error!.error.toString()));
    }
  }

  //left arrow
  Future<void> _onPayslipLeftArrowEvent(
      PayslipLeftArrowEvent event, Emitter<PayslipState> emit) async {
    emit(PayslipLeftArrowLoadingState());
    Future.delayed(const Duration(microseconds: 500)).then((value) {
      emit(PayslipLeftArrowSuccessState());
    }).catchError((onError) {
      emit(PayslipLeftArrowErrorState());
    });
  }

  //right arrow
  Future<void> _onPayslipRightArrowEvent(
      PayslipRightArrowEvent event, Emitter<PayslipState> emit) async {
    emit(PayslipRightArrowLoadingState());
    Future.delayed(const Duration(microseconds: 500)).then((value) {
      emit(PayslipRightArrowSuccessState());
    }).catchError((onError) {
      emit(PayslipRightArrowErrorState());
    });
  }

  //select date
  Future<void> _onPayslipSelectDateEvent(
      PayslipSelectDateEvent event, Emitter<PayslipState> emit) async {
    emit(PayslipSelectDateLoadingState());
    await selectDate(event.context).then((value) {}).catchError((onError) {
      print(onError.toString());
      emit(PayslipSelectDateErrorState());
    });
  }

  DateTime? picked;
  Future<void> selectDate(BuildContext context) async {
    if (Platform.isAndroid) {
      androidDatePicker(
        context: context,
        selectedDate: picked,
        firstDate: DateTime(2023),
        onSelectDate: (selectDate) {
          picked = selectDate;
          updateApiDataBasedOnDate(selectDate ?? DateTime.now());
        },
      );
    }
    if (Platform.isIOS) {
      iosDatePicker(
        context: context,
        selectedDate: picked,
        onChange: (selectDate) {
          Navigator.pop(context);
          picked = selectDate;
          updateApiDataBasedOnDate(selectDate);
        },
        onCancel: () {
          Navigator.pop(context);
        },
        onDone: () {
          Navigator.pop(context);
        },
      );
    }
  }

  updateApiDataBasedOnDate(DateTime selectDate) async {
    emit(PayslipSelectDateSuccessState(
        selectDate:
            "${DateFormat.MMMM().format(selectDate).toString()} ${selectDate.year}"));
    DataState dataState = await _payslipUseCase.call(
      employeeId: (await _getEmployerIdUseCase.call()) ?? 2220,
      month: selectDate.month,
      year: selectDate.year,
    );
    if (dataState is DataSuccess<PayslipModel>) {
      payslipModel = dataState.data;
      emit(PayslipGetDataSuccessState(payslipModel: payslipModel));
    } else {
      emit(PayslipGetDataErrorState(
          errorMSG: dataState.error!.error.toString()));
    }
  }
}
