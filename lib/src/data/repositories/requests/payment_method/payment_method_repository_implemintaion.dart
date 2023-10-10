import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payment_method/model/remote_payment_method.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payment_method/payment_method_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payment_method/request/payment_method_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/repositories/requests/payment_method/payment_method_repository.dart';

class PaymentMethodRepositoryImplementation extends PaymentMethodRepository {
  final PaymentMethodApiService _paymentMethodApiService;

  PaymentMethodRepositoryImplementation(this._paymentMethodApiService);

  @override
  Future<DataState<List<RequestPaymentMethod>>> paymentMethod() async {
    try {
      TalentLinkHrRequest<PaymentMethodRequest> request =
          await TalentLinkHrRequest<PaymentMethodRequest>()
              .createRequest(PaymentMethodRequest());

      final httpResponse =
          await _paymentMethodApiService.shortLeaveTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapPaymentMethodToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
