part of 'air_ticket_bloc.dart';

@immutable
abstract class AirTicketEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AirTicketBackEvent extends AirTicketEvent {}

class AirTicketOpenPaymentMethodBottomSheetEvent extends AirTicketEvent {}

class AirTicketSelectPaymentMethodEvent extends AirTicketEvent {
  final RequestPaymentMethod paymentMethod;

  AirTicketSelectPaymentMethodEvent({required this.paymentMethod});
}

class AirTicketSubmitEvent extends AirTicketEvent {
  final String paymentMethod;
  final bool isVisiblePaymentMethod;

  AirTicketSubmitEvent({
    required this.paymentMethod,
    required this.isVisiblePaymentMethod,
  });
}

class AirTicketShowPaymentMethodTextFieldEvent extends AirTicketEvent {
  final SingleSelectionModel singleSelectionModel;

  AirTicketShowPaymentMethodTextFieldEvent(
      {required this.singleSelectionModel});
}

class AirTicketValidationPaymentMethodEvent extends AirTicketEvent {
  final String value;

  AirTicketValidationPaymentMethodEvent({required this.value});
}
