import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';

abstract class AllFieldsMandatoryRepository {
  Future<DataState<List<AllFieldsMandatory>>> allFieldsMandatory({
    required int requestTypeId,
    required int requestData,
  });
}
