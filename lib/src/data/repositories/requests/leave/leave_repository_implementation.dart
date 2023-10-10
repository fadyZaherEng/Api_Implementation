import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/leave_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_alternative_employee.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_calculate_in_case_new_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_leave_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/alternative_employee_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/calculate_in_case_new_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/insert_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/leave_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';

class LeaveRepositoryImplementation extends LeaveRepository {
  final LeaveApiService _leaveApiService;

  LeaveRepositoryImplementation(this._leaveApiService);

  @override
  Future<DataState<List<RequestType>>> leaveTypes() async {
    try {
      TalentLinkHrRequest<LeaveTypeRequest> request =
          await TalentLinkHrRequest<LeaveTypeRequest>()
              .createRequest(LeaveTypeRequest());

      final httpResponse = await _leaveApiService.leaveTypes(request);

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
  Future<DataState<TalentLinkResponse>> insertLeave(
      {required InsertLeaveRequest request, File? file}) async {
    try {
      TalentLinkHrRequest<InsertLeaveRequest> insertLeaveRequest =
          await TalentLinkHrRequest<InsertLeaveRequest>()
              .createRequest(request);

      MultipartFile multipartFile =
          await MultipartFile.fromFile(file?.path ?? "", filename: "test");

      final httpResponse = await _leaveApiService
          .insertLeave(jsonEncode(insertLeaveRequest.toMap()), [multipartFile]);

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
  Future<DataState<List<LeaveAlternativeEmployee>>>
      alternativeEmployee() async {
    try {
      TalentLinkHrRequest<AlternativeEmployeeRequest> request =
          await TalentLinkHrRequest<AlternativeEmployeeRequest>()
              .createRequest(AlternativeEmployeeRequest());

      final httpResponse = await _leaveApiService.alternativeEmployee(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data:
              (httpResponse.data.result ?? []).mapAlternativeEmployeeToDomain(),
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
  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseNewLeave>>>
      calculateInCaseNewLeave({
    required CalculateInCaseNewLeaveRequest calculateInCaseNewLeaveRequest,
  })async {
    try {
      TalentLinkHrRequest<CalculateInCaseNewLeaveRequest>request = await TalentLinkHrRequest<CalculateInCaseNewLeaveRequest>().createRequest(calculateInCaseNewLeaveRequest);
      final httpResponse =
      await _leaveApiService.calculateInCaseNewLeave(request);

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
