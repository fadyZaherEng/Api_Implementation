import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payment_method/model/remote_payment_method.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'payment_method_api_service.g.dart';

@RestApi()
abstract class PaymentMethodApiService {
  factory PaymentMethodApiService(Dio dio) = _PaymentMethodApiService;

  @POST(APIKeys.paymentMethod)
  Future<HttpResponse<TalentLinkResponse<List<RemotePaymentMethod>>>>
  shortLeaveTypes(@Body() TalentLinkHrRequest request);
}
