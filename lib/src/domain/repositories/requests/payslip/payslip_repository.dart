import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';

abstract class PayslipRepository {
  Future<DataState<PayslipModel>> payslip({
    required int employeeId,
    required int month,
    required int year,
  });
}
