import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/half_day_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_half_day_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/half_day_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

import '../../../../domain/repositories/requests/half_day/half_day_repository.dart';

class HalfDayRepositoryImplementation extends HalfDayRepository {
  final HalfDayApiService _halfDayApiService;

  HalfDayRepositoryImplementation(this._halfDayApiService);


  @override
  Future<DataState<List<RequestType>>> halfDayTypes() async{
    try {
      TalentLinkHrRequest<HalfDayTypesRequest> request = await TalentLinkHrRequest<HalfDayTypesRequest>().createRequest(HalfDayTypesRequest());

      final httpResponse = await _halfDayApiService.halfDayTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapHalfDayTypesToDomain(),
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
