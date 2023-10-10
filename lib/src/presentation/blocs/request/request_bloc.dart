import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/usecase/request/navigate_to_requests_details_screen_use_case.dart';

part 'request_event.dart';

part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final NavigateToRequestsDetailsScreenUseCase
      _navigateToRequestsDetailsScreenUseCase;
  final List<Request> _requests = [
    Request(
        id: 1,
        text: 'Leave',
        imagePath: ImagePaths.leave,
        imageColor: "#FF664DC9"),
    Request(
        id: 2,
        text: 'Short Leave',
        imagePath: ImagePaths.shortLeave,
        imageColor: "#FF38CB89"),
    Request(
        id: 3,
        text: 'Leave Encashment',
        imagePath: ImagePaths.leaveCncashment,
        imageColor: "#FFFFAB00"),
    Request(
        id: 4,
        text: 'Loan',
        imagePath: ImagePaths.loan,
        imageColor: "#FF3E80EB"),
    Request(
        id: 5,
        text: 'Indemnity Encashment',
        imagePath: ImagePaths.indemnityEncashment,
        imageColor: "#FFEF4B4B"),
    Request(
        id: 6,
        text: 'Air Ticket',
        imagePath: ImagePaths.airTicket,
        imageColor: "#FF06C0D9"),
    Request(
        id: 7,
        text: 'Half Day Leave',
        imagePath: ImagePaths.halfDayLeave,
        imageColor: "#FF5238FF"),
    Request(
        id: 8,
        text: 'Resume Duty',
        imagePath: ImagePaths.resumeDuty,
        imageColor: "#FF1D996D"),
    Request(
        id: 9,
        text: 'Business Trip',
        imagePath: ImagePaths.businessTrip,
        imageColor: "#FF00635B"),
    Request(
        id: 10,
        text: 'Other Request',
        imagePath: ImagePaths.otherRequest,
        imageColor: "#FFDC4405"),
  ];

  RequestBloc(this._navigateToRequestsDetailsScreenUseCase)
      : super(RequestInitialState()) {
    on<GetRequestsEvent>(_onGetRequestsEvent);
    on<NavigateToRequestsDetailsScreen>(_onNavigateToRequestsDetailsScreen);
  }

  FutureOr<void> _onGetRequestsEvent(
      GetRequestsEvent event, Emitter<RequestState> emit) async {
    emit(GetRequestsSkeletonState());
    await Future.delayed(const Duration(seconds: 2));
    emit(GetRequestsSuccessState(requests: _requests));
  }

  FutureOr<void> _onNavigateToRequestsDetailsScreen(
      NavigateToRequestsDetailsScreen event, Emitter<RequestState> emit) {
    emit(_navigateToRequestsDetailsScreenUseCase(
      requestState: state,
      id: event.request.id,
    ));
  }
}
