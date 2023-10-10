part of 'air_ticket_bloc.dart';

@immutable
abstract class AirTicketState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AirTicketInitialState extends AirTicketState {}

class AirTicketLoadingState extends AirTicketState {}

class AirTicketBackState extends AirTicketState {}

class AirTicketOpenPaymentMethodBottomSheetState extends AirTicketState {}

class AirTicketSelectPaymentMethodState extends AirTicketState {
  final RequestPaymentMethod paymentMethod;

  AirTicketSelectPaymentMethodState({required this.paymentMethod});
}

class AirTicketShowPaymentMethodTextFieldState extends AirTicketState {
  final bool visiblePaymentMethod;

  AirTicketShowPaymentMethodTextFieldState(
      {required this.visiblePaymentMethod});
}

class AirTicketValidationPaymentMethodValidState extends AirTicketState {}

class AirTicketValidationPaymentMethodEmptyState extends AirTicketState {
  final String validationMassage;

  AirTicketValidationPaymentMethodEmptyState({required this.validationMassage});
}

class AirTicketSubmitSuccessState extends AirTicketState {
  final String successMassage;

  AirTicketSubmitSuccessState({required this.successMassage});
}
