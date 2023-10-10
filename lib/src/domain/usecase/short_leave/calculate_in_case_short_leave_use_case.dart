import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_calculate_in_case_short_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/request/calculate_in_case_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/short_leave/short_leave_repository.dart';

class CalculateInCaseShortLeaveUseCase {
  final ShortLeaveRepository _shortLeaveRepository;

  CalculateInCaseShortLeaveUseCase(this._shortLeaveRepository);

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseShortLeave>>> call({
    required CalculateInCaseShortLeaveRequest calculateInCaseShortLeaveRequest,
  }) async {
    return await _shortLeaveRepository.calculateInCaseShortLeave(
        calculateInCaseShortLeaveRequest: calculateInCaseShortLeaveRequest);
  }
}
