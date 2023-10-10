class AirTicketValidator {
  static AirTicketValidationState validatePaymentMethod(
      String paymentMethod) {
    if (paymentMethod.isEmpty) {
      return AirTicketValidationState.paymentMethodEmpty;
    } else {
      return AirTicketValidationState.valid;
    }
  }
}

enum AirTicketValidationState {
  paymentMethodEmpty,
  valid,
}
