import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/loan_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_calculate_in_case_loan.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_loan_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/calculate_in_case_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/insert_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/loan_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/loan/loan_repository.dart';

class LoanRepositoryImplementation extends LoanRepository {
  final LoanApiService _loanApiService;

  LoanRepositoryImplementation(this._loanApiService);

  @override
  Future<DataState<List<RequestType>>> loanTypes() async {
    try {
      TalentLinkHrRequest<LoanTypesRequest> request =
          await TalentLinkHrRequest<LoanTypesRequest>()
              .createRequest(LoanTypesRequest());

      final httpResponse = await _loanApiService.loanTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapLoanTypesToDomain(),
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
  Future<DataState<TalentLinkResponse>> insertLoan({
    required InsertLoanRequest request,
    File? file,
  }) async {
    try {
      TalentLinkHrRequest<InsertLoanRequest> insertLoanRequest =
          await TalentLinkHrRequest<InsertLoanRequest>().createRequest(request);

      MultipartFile multipartFile =
          await MultipartFile.fromFile(file?.path ?? "", filename: "test");

      final httpResponse = await _loanApiService
          .insertLoan(jsonEncode(insertLoanRequest.toMap()), [multipartFile]);

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
  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseLoan>>>
      calculateInCaseLoan({
    required CalculateInCaseLoanRequest request,
  }) async {
    try {
      TalentLinkHrRequest<CalculateInCaseLoanRequest>
          calculateInCaseLoanRequest =
          await TalentLinkHrRequest<CalculateInCaseLoanRequest>()
              .createRequest(request);
      final httpResponse =
          await _loanApiService.calculateInCaseLoan(calculateInCaseLoanRequest);

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
