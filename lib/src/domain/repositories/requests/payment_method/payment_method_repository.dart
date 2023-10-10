import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class PaymentMethodRepository {
  Future<DataState<List<RequestPaymentMethod>>> paymentMethod();
}
