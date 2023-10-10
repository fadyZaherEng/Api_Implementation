import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_calculate_in_case_short_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_short_leave_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/request/calculate_in_case_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/request/short_leave_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/short_leave_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/short_leave/short_leave_repository.dart';

class ShortLeaveRepositoryImplementation extends ShortLeaveRepository {
  final ShortLeaveApiService _shortLeaveApiService;

  ShortLeaveRepositoryImplementation(this._shortLeaveApiService);

  @override
  Future<DataState<List<RequestType>>> shortLeaveTypes() async {
    try {
      TalentLinkHrRequest<ShortLeaveTypesRequest> request =
          await TalentLinkHrRequest<ShortLeaveTypesRequest>()
              .createRequest(ShortLeaveTypesRequest());

      final httpResponse = await _shortLeaveApiService.shortLeaveTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapShortLeaveTypesToDomain(),
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

  @override
  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseShortLeave>>>
      calculateInCaseShortLeave(
          {required CalculateInCaseShortLeaveRequest
              calculateInCaseShortLeaveRequest}) async {
    try {
      TalentLinkHrRequest<CalculateInCaseShortLeaveRequest> request =
          await TalentLinkHrRequest<CalculateInCaseShortLeaveRequest>()
              .createRequest(calculateInCaseShortLeaveRequest);
      final httpResponse =
          await _shortLeaveApiService.calculateInCaseShortLeave(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data,
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
