import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_calculate_in_case_leave_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/calculate_in_case_leave_encashment_request.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';

class CalculateInCaseLeaveEncashmentUseCase {
  final LeaveEncashmentRepository _repository;

  CalculateInCaseLeaveEncashmentUseCase(this._repository);

  Future<DataState<RemoteCalculateInCaseLeaveEncashment>> call({
    required CalculateInCaseLeaveEncashmentRequest
        calculateInCaseLeaveEncashmentRequest,
  }) async {
    return await _repository
        .calculateInCaseLeaveEncashment(calculateInCaseLeaveEncashmentRequest);
  }
}
