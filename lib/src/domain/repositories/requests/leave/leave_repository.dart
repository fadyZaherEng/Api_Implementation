import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/model/remote_calculate_in_case_new_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/calculate_in_case_new_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/insert_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class LeaveRepository {
  Future<DataState<List<RequestType>>> leaveTypes();

  Future<DataState<TalentLinkResponse>> insertLeave(
      {required InsertLeaveRequest request, File? file});

  Future<DataState<List<LeaveAlternativeEmployee>>> alternativeEmployee();

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseNewLeave>>>
      calculateInCaseNewLeave({
    required CalculateInCaseNewLeaveRequest calculateInCaseNewLeaveRequest,
  });

}
