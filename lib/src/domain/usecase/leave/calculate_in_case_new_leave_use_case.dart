import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_calculate_in_case_new_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/calculate_in_case_new_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';

class CalculateInCaseNewLeaveUseCase {
  final LeaveRepository _leaveRepository;

  CalculateInCaseNewLeaveUseCase(this._leaveRepository);

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseNewLeave>>> call({
    required CalculateInCaseNewLeaveRequest calculateInCaseNewLeaveRequest,
  }) async {
    return await _leaveRepository.calculateInCaseNewLeave(
        calculateInCaseNewLeaveRequest: calculateInCaseNewLeaveRequest);
  }
}
