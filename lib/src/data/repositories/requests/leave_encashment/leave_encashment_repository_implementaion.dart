import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/leave_encashment_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_calculate_in_case_leave_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_get_employee_policy_profile_leave_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_leave_encashment_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/calculate_in_case_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/get_employee_policy_profile_leave_encashment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/insert_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/leave_encashment_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';

class LeaveEncashmentRepositoryImplementation
    extends LeaveEncashmentRepository {
  final LeaveEncashmentApiService _leaveEncashmentApiService;

  LeaveEncashmentRepositoryImplementation(this._leaveEncashmentApiService);

  @override
  Future<DataState<List<RequestType>>> leaveEncashmentTypes() async {
    try {
      TalentLinkHrRequest<LeaveEncashmentTypeRequest> request =
          await TalentLinkHrRequest<LeaveEncashmentTypeRequest>()
              .createRequest(LeaveEncashmentTypeRequest());

      final httpResponse =
          await _leaveEncashmentApiService.leaveEncashmentTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapLeaveTypesToDomain(),
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
  Future<DataState<TalentLinkResponse>> insertLeaveEncashment(
      {required InsertLeaveEncashmentRequest request, File? file}) async {
    try {
      TalentLinkHrRequest<InsertLeaveEncashmentRequest>
          insertLeaveEncashmentRequest =
          await TalentLinkHrRequest<InsertLeaveEncashmentRequest>()
              .createRequest(request);

      MultipartFile multipartFile =
          await MultipartFile.fromFile(file?.path ?? "", filename: "test");

      final httpResponse = await _leaveEncashmentApiService
          .insertLeaveEncashment(
              jsonEncode(insertLeaveEncashmentRequest.toMap()),
              [multipartFile]);

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

  @override
  Future<DataState<List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>>
      getEmployeePolicyProfileLeaveEncashmentDetailsRequest(
          GetEmployeePolicyProfileLeaveEncashmentDetailsRequest
              getEmployeePolicyProfileLeaveEncashmentDetailsRequest) async {
    try {
      TalentLinkHrRequest<GetEmployeePolicyProfileLeaveEncashmentDetailsRequest>
          request = await TalentLinkHrRequest<
                  GetEmployeePolicyProfileLeaveEncashmentDetailsRequest>()
              .createRequest(
                  GetEmployeePolicyProfileLeaveEncashmentDetailsRequest(
                      employeeId:
                          getEmployeePolicyProfileLeaveEncashmentDetailsRequest
                              .employeeId));

      final httpResponse = await _leaveEncashmentApiService
          .getEmployeePolicyProfileLeaveEncashmentDetails(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []),
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
  Future<DataState<RemoteCalculateInCaseLeaveEncashment>>
      calculateInCaseLeaveEncashment(
          CalculateInCaseLeaveEncashmentRequest
              calculateInCaseLeaveEncashmentRequest) async {
    try {
      TalentLinkHrRequest<CalculateInCaseLeaveEncashmentRequest> request =
          await TalentLinkHrRequest<CalculateInCaseLeaveEncashmentRequest>()
              .createRequest(calculateInCaseLeaveEncashmentRequest);
      final httpResponse = await _leaveEncashmentApiService
          .calculateInCaseLeaveEncashment(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result ??
              RemoteCalculateInCaseLeaveEncashment(),
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
