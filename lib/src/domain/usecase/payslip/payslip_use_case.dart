import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/domain/repositories/requests/payslip/payslip_repository.dart';

class PayslipUseCase {
  final PayslipRepository _payslipRepository;
  PayslipUseCase(this._payslipRepository);
  Future<DataState<PayslipModel>> call({
    required int employeeId,
    required int month,
    required int year,
  }) async {
    return await _payslipRepository.payslip(
      employeeId: employeeId,
      month: month,
      year: year,
    );
  }
}
