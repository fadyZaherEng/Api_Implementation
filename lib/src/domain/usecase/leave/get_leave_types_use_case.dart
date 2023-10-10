import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';

class GetLeaveTypesUseCase {
  final LeaveRepository _leaveRepository;

  GetLeaveTypesUseCase(this._leaveRepository);

  Future<DataState<List<RequestType>>> call() async {
    return await _leaveRepository.leaveTypes();
  }
}
