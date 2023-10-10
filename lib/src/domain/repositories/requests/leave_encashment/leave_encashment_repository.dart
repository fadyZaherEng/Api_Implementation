import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_calculate_in_case_leave_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_get_employee_policy_profile_leave_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/calculate_in_case_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/get_employee_policy_profile_leave_encashment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/insert_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class LeaveEncashmentRepository {
  Future<DataState<List<RequestType>>> leaveEncashmentTypes();

  Future<DataState<TalentLinkResponse>> insertLeaveEncashment(
      {required InsertLeaveEncashmentRequest request, File? file});

  Future<DataState<List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails>>>
      getEmployeePolicyProfileLeaveEncashmentDetailsRequest(
          GetEmployeePolicyProfileLeaveEncashmentDetailsRequest
              getEmployeePolicyProfileLeaveEncashmentDetailsRequest);

  Future<DataState<RemoteCalculateInCaseLeaveEncashment>>
      calculateInCaseLeaveEncashment(
          CalculateInCaseLeaveEncashmentRequest
              calculateInCaseLeaveEncashmentRequest);
}
