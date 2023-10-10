import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/all_fields/all_fields_mandatory_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/half_day_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/leave_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/leave_encashment_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/loan_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/other_request_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payment_method/payment_method_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payslip/payslip_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/resume_duty_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/short_leave_api_service.dart';

final injector = GetIt.instance;

Future<void> initializeDataDependencies() async {
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = APIKeys.baseUrl
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  injector.registerFactory<LeaveApiService>(() => LeaveApiService(injector()));
  injector.registerFactory<LeaveEncashmentApiService>(
      () => LeaveEncashmentApiService(injector()));
  injector.registerFactory<ShortLeaveApiService>(
      () => ShortLeaveApiService(injector()));
  injector.registerFactory<PaymentMethodApiService>(
      () => PaymentMethodApiService(injector()));
  injector.registerFactory<LoanApiService>(() => LoanApiService(injector()));
  injector
      .registerFactory<HalfDayApiService>(() => HalfDayApiService(injector()));
  injector.registerFactory<ResumeDutyApiService>(
      () => ResumeDutyApiService(injector()));

  injector.registerFactory<OtherRequestApiService>(
      () => OtherRequestApiService(injector()));
  injector.registerFactory<AllFieldsMandatoryApiService>(
      () => AllFieldsMandatoryApiService(injector()));
  injector
      .registerFactory<PayslipApiService>(() => PayslipApiService(injector()));
}
