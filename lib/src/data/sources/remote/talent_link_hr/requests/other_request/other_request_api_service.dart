import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/model/rempte_other_request_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'other_request_api_service.g.dart';

@RestApi()
abstract class OtherRequestApiService {
  factory OtherRequestApiService(Dio dio) = _OtherRequestApiService;

  @POST(APIKeys.otherRequestTypes)
  Future<HttpResponse<TalentLinkResponse<List<RemoteOtherRequestTypes>>>>
  otherRequestTypes(@Body() TalentLinkHrRequest request);
}
