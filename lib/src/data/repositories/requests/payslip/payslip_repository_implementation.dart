import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payslip/model/payslip_content.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payslip/payslip_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payslip/request/payslip_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/domain/repositories/requests/payslip/payslip_repository.dart';

class PayslipRepositoryImplementation extends PayslipRepository {
  final PayslipApiService _payslipApiService;

  PayslipRepositoryImplementation(this._payslipApiService);

  @override
  Future<DataState<PayslipModel>> payslip({
    required int employeeId,
    required int month,
    required int year,
  }) async {
    try {
      TalentLinkHrRequest<PayslipRequest> request =
          await TalentLinkHrRequest<PayslipRequest>().createRequest(
              PayslipRequest(employeeId: employeeId, month: month, year: year));

      final httpResponse = await _payslipApiService.payslip(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain() ??
              PayslipModel(
                  salary: 10000,
                  basicSalary: 7000,
                  hour: 8,
                  additions: 2,
                  decuted: 1),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
