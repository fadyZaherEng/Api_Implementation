import 'package:talent_link/src/presentation/blocs/request/request_bloc.dart';

class NavigateToRequestsDetailsScreenUseCase {
  RequestState call({
    required RequestState requestState,
    required int id,
  }) {
    if (id == 1) {
      requestState = NavigateToLeaveScreenState();
    } else if (id == 2) {
      requestState = NavigateToShortLeaveScreenState();
    } else if (id == 3) {
      requestState = NavigateToLeaveEncashmentScreenState();
    } else if (id == 4) {
      requestState = NavigateToLoanScreenState();
    } else if (id == 5) {
      requestState = NavigateToIndemnityScreenState();
    } else if (id == 6) {
      requestState = NavigateToAirTicketScreenState();
    } else if (id == 7) {
      requestState = NavigateToHalfDayLeaveScreenState();
    } else if (id == 8) {
      requestState = NavigateToResumeDutyScreenState();
    } else if (id == 9) {
      requestState = NavigateToBusinessTripScreenState();
    } else if (id == 10) {
      requestState = NavigateToOtherRequestScreenState();
    }

    return requestState;
  }
}
