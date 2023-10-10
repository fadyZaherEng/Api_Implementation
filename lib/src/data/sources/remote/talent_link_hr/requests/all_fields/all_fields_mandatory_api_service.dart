import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/all_fields/model/remote_all_fields_mandatory.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'all_fields_mandatory_api_service.g.dart';

@RestApi()
abstract class AllFieldsMandatoryApiService {
  factory AllFieldsMandatoryApiService(Dio dio) = _AllFieldsMandatoryApiService;

  @POST(APIKeys.getAllMandatoryFields)
  Future<HttpResponse<TalentLinkResponse<List<RemoteAllFieldsMandatory>>>> allFieldsMandatory(
      @Body() TalentLinkHrRequest request);
}
