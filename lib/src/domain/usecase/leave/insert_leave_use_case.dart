import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/request/insert_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';

class InsertLeaveUseCase {
  final LeaveRepository _leaveRepository;

  InsertLeaveUseCase(this._leaveRepository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertLeaveRequest request, File? file}) async {
    return await _leaveRepository.insertLeave(request: request, file: file);
  }
}
