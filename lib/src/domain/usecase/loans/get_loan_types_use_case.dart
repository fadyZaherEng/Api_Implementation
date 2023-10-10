import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/loan/loan_repository.dart';

class GetLoanTypesUseCase {
  final LoanRepository _repository;

  GetLoanTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.loanTypes();
  }
}
