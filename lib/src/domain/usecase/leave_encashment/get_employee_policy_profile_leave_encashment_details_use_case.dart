import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_get_employee_policy_profile_leave_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/get_employee_policy_profile_leave_encashment_details_request.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';

class GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase {
  final LeaveEncashmentRepository _repository;

  GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase(this._repository);

  Future<DataState<List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>>
      call({
    required int employeeId,
  }) async {
    return await _repository
        .getEmployeePolicyProfileLeaveEncashmentDetailsRequest(
            GetEmployeePolicyProfileLeaveEncashmentDetailsRequest(
                employeeId: employeeId));
  }
}
