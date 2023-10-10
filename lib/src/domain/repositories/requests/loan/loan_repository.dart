import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_calculate_in_case_loan.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/calculate_in_case_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/insert_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class LoanRepository {
  Future<DataState<List<RequestType>>> loanTypes();

  Future<DataState<TalentLinkResponse>> insertLoan({
    required InsertLoanRequest request,
    File? file,
  });

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseLoan>>>
      calculateInCaseLoan({
    required CalculateInCaseLoanRequest request,
  });
}
