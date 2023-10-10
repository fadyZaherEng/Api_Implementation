import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/request/insert_leave_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class ResumeDutyRepository {
  Future<DataState<List<RequestType>>> resumeDutyReferenceTypes();

  Future<DataState<List<RequestType>>> resumeDutyReferenceData(
      {required ResumeDutyReferenceDataRequest referenceDataRequest});

}
