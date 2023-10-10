import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/insert_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/loan/loan_repository.dart';

class InsertLoanUseCase {
  final LoanRepository _loanRepository;

  InsertLoanUseCase(this._loanRepository);

  Future<DataState<TalentLinkResponse>> call({
    required InsertLoanRequest request,
    File? file,
  }) async {
    return await _loanRepository.insertLoan(request: request, file: file);
  }
}
