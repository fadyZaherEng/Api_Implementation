import 'package:talent_link/src/core/utils/validation/air_ticket_validator.dart';

class AirTicketValidationUseCase {
  AirTicketValidationState validatePaymentMethod(String paymentMethod) {
    return AirTicketValidator.validatePaymentMethod(
      paymentMethod,
    );
  }
}
