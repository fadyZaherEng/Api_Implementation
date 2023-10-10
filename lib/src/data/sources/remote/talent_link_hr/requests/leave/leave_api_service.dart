import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_alternative_employee.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_calculate_in_case_new_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_leave_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/alternative_employee_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/calculate_in_case_new_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/leave_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'leave_api_service.g.dart';

@RestApi()
abstract class LeaveApiService {
  factory LeaveApiService(Dio dio) = _LeaveApiService;

  @POST(APIKeys.leaveTypes)
  Future<HttpResponse<TalentLinkResponse<List<RemoteLeaveTypes>>>> leaveTypes(
      @Body() TalentLinkHrRequest<LeaveTypeRequest> request);

  @POST(APIKeys.alternativeEmployee)
  Future<HttpResponse<TalentLinkResponse<List<RemoteAlternativeEmployee>>>>
      alternativeEmployee(
          @Body() TalentLinkHrRequest<AlternativeEmployeeRequest> request);

  @POST(APIKeys.insertLeave)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertLeave(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.calculateInCaseNewLeave)
  Future<HttpResponse<TalentLinkResponse<RemoteCalculateInCaseNewLeave>>>
      calculateInCaseNewLeave(
          @Body() TalentLinkHrRequest request);
}
