import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_calculate_in_case_loan.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_loan_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'loan_api_service.g.dart';

@RestApi()
abstract class LoanApiService {
  factory LoanApiService(Dio dio) = _LoanApiService;

  @POST(APIKeys.loanTypes)
  Future<HttpResponse<TalentLinkResponse<List<RemoteLoanTypes>>>> loanTypes(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.insertLoan)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertLoan(
    @Part(name: 'requestbody') String requestBody,
    @Part(name: "Files") List<MultipartFile> file,
  );

  @POST(APIKeys.calculateInCaseLoan)
  Future<HttpResponse<TalentLinkResponse<RemoteCalculateInCaseLoan>>>
      calculateInCaseLoan(@Body() TalentLinkHrRequest request);
}
