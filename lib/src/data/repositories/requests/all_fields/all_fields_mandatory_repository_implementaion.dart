import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/all_fields/all_fields_mandatory_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/all_fields/model/remote_all_fields_mandatory.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/all_fields/request/all_fields_request_mandatory.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/repositories/requests/all_fields_mandatory/all_fields_mandatory_repository.dart';

class AllFieldsMandatoryRepositoryImplementation
    extends AllFieldsMandatoryRepository {
  final AllFieldsMandatoryApiService _allFieldsMandatoryApiService;

  AllFieldsMandatoryRepositoryImplementation(
      this._allFieldsMandatoryApiService);

  @override
  Future<DataState<List<AllFieldsMandatory>>> allFieldsMandatory({
    required int requestTypeId,
    required int requestData,
  }) async {
    try {
      TalentLinkHrRequest<AllFieldsMandatoryRequest> request =
          await TalentLinkHrRequest<AllFieldsMandatoryRequest>().createRequest(
              AllFieldsMandatoryRequest(
                  requestData: requestData, requestTypeId: requestTypeId));

      final httpResponse =
          await _allFieldsMandatoryApiService.allFieldsMandatory(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data:
              (httpResponse.data.result ?? []).mapAllFieldsMandatoryToDomain(),
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
