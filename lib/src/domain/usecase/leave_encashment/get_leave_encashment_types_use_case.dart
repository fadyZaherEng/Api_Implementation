import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';

class GetLeaveEncashmentTypesUseCase {
  final LeaveEncashmentRepository _repository;

  GetLeaveEncashmentTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.leaveEncashmentTypes();
  }
}
