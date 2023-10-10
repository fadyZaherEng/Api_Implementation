import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/model/remote_calculate_in_case_loan.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/request/calculate_in_case_loan_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/loan/loan_repository.dart';

class CalculateInCaseLoanUseCase {
  final LoanRepository _repository;

  CalculateInCaseLoanUseCase(this._repository);

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseLoan>>> call({
    required CalculateInCaseLoanRequest request,
  }) async {
    return await _repository.calculateInCaseLoan(request: request);
  }
}
