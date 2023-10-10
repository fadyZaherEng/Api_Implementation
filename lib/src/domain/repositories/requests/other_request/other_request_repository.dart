import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class OtherRequestRepository {
  Future<DataState<List<RequestType>>> otherRequestTypes();
}
