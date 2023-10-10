import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';

class GetResumeDutyReferenceDataUseCase {
  final ResumeDutyRepository _repository;

  GetResumeDutyReferenceDataUseCase(this._repository);

  Future<DataState<List<RequestType>>> call({
    required ResumeDutyReferenceDataRequest request,
  }) async {
    return await _repository.resumeDutyReferenceData(
        referenceDataRequest: request);
  }
}
