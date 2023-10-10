import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/insert_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';

class InsertLeaveEncashmentUseCase {
  final LeaveEncashmentRepository _leaveEncashmentRepository;

  InsertLeaveEncashmentUseCase(this._leaveEncashmentRepository);

  Future<DataState<TalentLinkResponse>> call({
    required InsertLeaveEncashmentRequest request,
    File? file,
  }) async {
    return await _leaveEncashmentRepository.insertLeaveEncashment(
        request: request, file: file);
  }
}
