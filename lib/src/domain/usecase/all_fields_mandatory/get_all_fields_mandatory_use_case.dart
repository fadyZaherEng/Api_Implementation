import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/repositories/requests/all_fields_mandatory/all_fields_mandatory_repository.dart';

class GetAllFieldsMandatoryUseCase {
  final AllFieldsMandatoryRepository _repository;

  GetAllFieldsMandatoryUseCase(this._repository);

  Future<DataState<List<AllFieldsMandatory>>> call({
    required int requestTypeId,
    required int requestData,
  }) async {
    return await _repository.allFieldsMandatory(
        requestTypeId: requestTypeId, requestData: requestData);
  }
}
