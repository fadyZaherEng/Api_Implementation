import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/repositories/requests/payment_method/payment_method_repository.dart';

class GetPaymentMethodUseCase {
  final PaymentMethodRepository _repository;

  GetPaymentMethodUseCase(this._repository);

  Future<DataState<List<RequestPaymentMethod>>> call() async {
    return await _repository.paymentMethod();
  }
}
