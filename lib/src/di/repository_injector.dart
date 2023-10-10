import 'package:talent_link/src/data/repositories/requests/all_fields/all_fields_mandatory_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/half_day/half_day_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/leave/leave_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/leave_encashment/leave_encashment_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/loan/loan_types_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/other_request/other_request_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/payment_method/payment_method_repository_implemintaion.dart';
import 'package:talent_link/src/data/repositories/requests/payslip/payslip_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/resume_duty/resume_duty_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/short_leave/short_leave_repository_implemention.dart';
import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/repositories/requests/all_fields_mandatory/all_fields_mandatory_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/half_day/half_day_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/loan/loan_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/other_request/other_request_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/payment_method/payment_method_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/payslip/payslip_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/short_leave/short_leave_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<LeaveRepository>(
      () => LeaveRepositoryImplementation(injector()));
  injector.registerFactory<LeaveEncashmentRepository>(
      () => LeaveEncashmentRepositoryImplementation(injector()));
  injector.registerFactory<ShortLeaveRepository>(
      () => ShortLeaveRepositoryImplementation(injector()));
  injector.registerFactory<PaymentMethodRepository>(
      () => PaymentMethodRepositoryImplementation(injector()));
  injector.registerFactory<LoanRepository>(
      () => LoanRepositoryImplementation(injector()));
  injector.registerFactory<HalfDayRepository>(
      () => HalfDayRepositoryImplementation(injector()));
  injector.registerFactory<ResumeDutyRepository>(
      () => ResumeDutyRepositoryImplementation(injector()));
  injector.registerFactory<OtherRequestRepository>(
      () => OtherRequestRepositoryImplementation(injector()));
  injector.registerFactory<AllFieldsMandatoryRepository>(
      () => AllFieldsMandatoryRepositoryImplementation(injector()));
  injector.registerFactory<PayslipRepository>(
      () => PayslipRepositoryImplementation(injector()));
}
