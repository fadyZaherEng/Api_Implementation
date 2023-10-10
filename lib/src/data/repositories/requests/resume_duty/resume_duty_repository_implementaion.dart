import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_resume_duty_reference_data.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_resume_duty_reference_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/resume_duty_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';

class ResumeDutyRepositoryImplementation extends ResumeDutyRepository {
  final ResumeDutyApiService _resumeDutyApiService;

  ResumeDutyRepositoryImplementation(this._resumeDutyApiService);

  @override
  Future<DataState<List<RequestType>>> resumeDutyReferenceTypes() async {
    try {
      TalentLinkHrRequest<ResumeDutyReferenceTypesRequest> request =
          await TalentLinkHrRequest<ResumeDutyReferenceTypesRequest>()
              .createRequest(ResumeDutyReferenceTypesRequest());

      final httpResponse =
          await _resumeDutyApiService.resumeDutyReferenceTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapResumeDutyReferenceTypesToDomain(),
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
  Future<DataState<List<RequestType>>> resumeDutyReferenceData(
      {required ResumeDutyReferenceDataRequest referenceDataRequest}) async{
    try {
      TalentLinkHrRequest<ResumeDutyReferenceDataRequest> request =
          await TalentLinkHrRequest<ResumeDutyReferenceDataRequest>()
              .createRequest(referenceDataRequest);

      final httpResponse =
          await _resumeDutyApiService.resumeDutyReferenceData(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapResumeDutyReferenceDataToDomain(),
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
