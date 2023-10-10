part of 'request_bloc.dart';

@immutable
abstract class RequestState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class RequestInitialState extends RequestState {}

class GetRequestsSkeletonState extends RequestState {}

class GetRequestsSuccessState extends RequestState {
  final List<Request> requests;

  GetRequestsSuccessState({
    required this.requests,
  });
}

class GetRequestsErrorState extends RequestState {
  final String errorMassage;

  GetRequestsErrorState({
    required this.errorMassage,
  });
}

class NavigateToLeaveScreenState extends RequestState {}

class NavigateToShortLeaveScreenState extends RequestState {}

class NavigateToLeaveEncashmentScreenState extends RequestState {}

class NavigateToLoanScreenState extends RequestState {}

class NavigateToIndemnityScreenState extends RequestState {}

class NavigateToAirTicketScreenState extends RequestState {}

class NavigateToHalfDayLeaveScreenState extends RequestState {}

class NavigateToResumeDutyScreenState extends RequestState {}

class NavigateToBusinessTripScreenState extends RequestState {}

class NavigateToOtherRequestScreenState extends RequestState {}
