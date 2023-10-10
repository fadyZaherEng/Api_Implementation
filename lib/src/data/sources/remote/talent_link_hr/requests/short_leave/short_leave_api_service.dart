import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_calculate_in_case_short_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_short_leave_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'short_leave_api_service.g.dart';

@RestApi()
abstract class ShortLeaveApiService {
  factory ShortLeaveApiService(Dio dio) = _ShortLeaveApiService;

  @POST(APIKeys.shortLeaveTypes)
  Future<HttpResponse<TalentLinkResponse<List<RemoteShortLeaveTypes>>>>
      shortLeaveTypes(@Body() TalentLinkHrRequest request);


  @POST(APIKeys.calculateInCaseShortLeave)
  Future<HttpResponse<TalentLinkResponse<RemoteCalculateInCaseShortLeave>>>
  calculateInCaseShortLeave(@Body() TalentLinkHrRequest request);
}
