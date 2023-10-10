import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_calculate_in_case_leave_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_get_employee_policy_profile_leave_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_leave_encashment_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'leave_encashment_api_service.g.dart';

@RestApi()
abstract class LeaveEncashmentApiService {
  factory LeaveEncashmentApiService(Dio dio) = _LeaveEncashmentApiService;

  @POST(APIKeys.leaveEncashmentTypes)
  Future<HttpResponse<TalentLinkResponse<List<RemoteLeaveEncashmentTypes>>>>
      leaveEncashmentTypes(@Body() TalentLinkHrRequest request);

  @POST(APIKeys.insertLeaveEncashment)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertLeaveEncashment(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.getEmployeePolicyProfileLeaveEncashmentDetails)
  Future<
          HttpResponse<
              TalentLinkResponse<
                  List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>>>
      getEmployeePolicyProfileLeaveEncashmentDetails(
          @Body() TalentLinkHrRequest request);

  @POST(APIKeys.calculateInCaseLeaveEncashment)
  Future<
          HttpResponse<
              TalentLinkResponse<RemoteCalculateInCaseLeaveEncashment>>>
      calculateInCaseLeaveEncashment(
          @Body() TalentLinkHrRequest request);
}
