import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';

class GetAlternativeEmployeeUseCase {
  final LeaveRepository _leaveRepository;

  GetAlternativeEmployeeUseCase(this._leaveRepository);

  Future<DataState<List<LeaveAlternativeEmployee>>> call() async {
    return await _leaveRepository.alternativeEmployee();
  }
}
