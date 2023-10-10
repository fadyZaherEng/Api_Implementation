import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_half_day_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'half_day_api_service.g.dart';

@RestApi()
abstract class HalfDayApiService {
  factory HalfDayApiService(Dio dio) = _HalfDayApiService;

  @POST(APIKeys.halfDayTypes)
  Future<HttpResponse<TalentLinkResponse<List<RemoteHalfDayTypes>>>> halfDayTypes(
      @Body() TalentLinkHrRequest request);
}
