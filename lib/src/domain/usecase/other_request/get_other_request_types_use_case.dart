import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/other_request/other_request_repository.dart';

class GetOtherRequestTypesUseCase {
  final OtherRequestRepository _repository;

  GetOtherRequestTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.otherRequestTypes();
  }
}
