import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/short_leave/short_leave_repository.dart';

class GetShortLeaveTypesUseCase {
  final ShortLeaveRepository _repository;

  GetShortLeaveTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.shortLeaveTypes();
  }
}
