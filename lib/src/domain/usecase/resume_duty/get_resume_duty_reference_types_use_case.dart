import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';

class GetResumeDutyReferenceTypesUseCase {
  final ResumeDutyRepository _repository;

  GetResumeDutyReferenceTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.resumeDutyReferenceTypes();
  }
}
