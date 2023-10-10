import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payslip/model/payslip_content.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'payslip_api_service.g.dart';

@RestApi()
abstract class PayslipApiService {
  factory PayslipApiService(Dio dio) = _PayslipApiService;

  @POST(APIKeys.payslip)
  Future<HttpResponse<TalentLinkResponse<PayslipContent>>> payslip(
      @Body() TalentLinkHrRequest request);
}
