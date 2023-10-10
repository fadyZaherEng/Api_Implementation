import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/model/rempte_other_request_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/other_request_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/request/other_request_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/other_request/other_request_repository.dart';

class OtherRequestRepositoryImplementation extends OtherRequestRepository {
  final OtherRequestApiService _otherRequestApiService;

  OtherRequestRepositoryImplementation(this._otherRequestApiService);

  @override
  Future<DataState<List<RequestType>>> otherRequestTypes() async {
    try {
      TalentLinkHrRequest<OtherRequestTypes> request =
          await TalentLinkHrRequest<OtherRequestTypes>()
              .createRequest(OtherRequestTypes());

      final httpResponse =
          await _otherRequestApiService.otherRequestTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapOtherRequestTypesToDomain(),
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
