import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/air_ticket_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/business_trip/business_trip_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_operating_system_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_serial_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_firebase_notfication_token_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_app_version_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_operating_system_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_serial_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_type_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_firebase_notification_token_usecase.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/get_half_day_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/half_day_leave_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/indemnity_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/calculate_in_case_new_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/get_alternative_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/get_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/insert_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/leave_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/calculate_in_case_leave_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/get_employee_policy_profile_leave_encashment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/get_leave_encashment_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/insert_leave_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/leave_encashmen_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/calculate_in_case_loan_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/get_loan_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/insert_loan_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/loans_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/get_other_request_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/other_request_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/domain/usecase/payslip/get_employer_id_usecase.dart';
import 'package:talent_link/src/domain/usecase/payslip/payslip_use_case.dart';
import 'package:talent_link/src/domain/usecase/request/navigate_to_requests_details_screen_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_data_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/resume_duty_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/calculate_in_case_short_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/get_short_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/short_leave_validation_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<NavigateToRequestsDetailsScreenUseCase>(
      () => NavigateToRequestsDetailsScreenUseCase());
  injector
      .registerFactory<LeaveValidationUseCase>(() => LeaveValidationUseCase());
  injector.registerFactory<ShortLeaveValidationUseCase>(
      () => ShortLeaveValidationUseCase());
  injector.registerFactory<LeaveEncashmentValidationUseCase>(
      () => LeaveEncashmentValidationUseCase());
  injector.registerFactory<IndemnityEncashmentValidationUseCase>(
      () => IndemnityEncashmentValidationUseCase());
  injector
      .registerFactory<LoansValidationUseCase>(() => LoansValidationUseCase());
  injector.registerFactory<HalfDayLeaveValidationUseCase>(
      () => HalfDayLeaveValidationUseCase());
  injector.registerFactory<ResumeDutyValidationUseCase>(
      () => ResumeDutyValidationUseCase());
  injector.registerFactory<BusinessTripValidationUseCase>(
      () => BusinessTripValidationUseCase());
  injector.registerFactory<AirTicketValidationUseCase>(
      () => AirTicketValidationUseCase());
  injector.registerFactory<OtherRequestValidationUseCase>(
      () => OtherRequestValidationUseCase());
  injector.registerFactory<GetDeviceOperatingSystemUseCase>(
      () => GetDeviceOperatingSystemUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetDeviceSerialUseCase>(
      () => GetDeviceSerialUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetFirebaseNotificationTokenUseCase>(
      () => GetFirebaseNotificationTokenUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveAppVersionUseCase>(
      () => SaveAppVersionUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveDeviceOperatingSystemUseCase>(
      () => SaveDeviceOperatingSystemUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveDeviceSerialUseCase>(
      () => SaveDeviceSerialUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveDeviceTypeUseCase>(
      () => SaveDeviceTypeUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveFirebaseNotificationTokenUseCase>(() =>
      SaveFirebaseNotificationTokenUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetLeaveTypesUseCase>(
      () => GetLeaveTypesUseCase(injector()));
  injector.registerFactory<InsertLeaveUseCase>(
      () => InsertLeaveUseCase(injector()));
  injector.registerFactory<GetLeaveEncashmentTypesUseCase>(
      () => GetLeaveEncashmentTypesUseCase(injector()));
  injector.registerFactory<GetShortLeaveTypesUseCase>(
      () => GetShortLeaveTypesUseCase(injector()));
  injector.registerFactory<GetPaymentMethodUseCase>(
      () => GetPaymentMethodUseCase(injector()));
  injector.registerFactory<GetLoanTypesUseCase>(
      () => GetLoanTypesUseCase(injector()));
  injector.registerFactory<GetHalfDayTypesUseCase>(
      () => GetHalfDayTypesUseCase(injector()));
  injector.registerFactory<GetResumeDutyReferenceTypesUseCase>(
      () => GetResumeDutyReferenceTypesUseCase(injector()));
  injector.registerFactory<GetOtherRequestTypesUseCase>(
      () => GetOtherRequestTypesUseCase(injector()));
  injector.registerFactory<GetAlternativeEmployeeUseCase>(
      () => GetAlternativeEmployeeUseCase(injector()));
  injector.registerFactory<GetResumeDutyReferenceDataUseCase>(
      () => GetResumeDutyReferenceDataUseCase(injector()));
  injector.registerFactory<InsertLeaveEncashmentUseCase>(
      () => InsertLeaveEncashmentUseCase(injector()));
  injector
      .registerFactory<InsertLoanUseCase>(() => InsertLoanUseCase(injector()));
  injector.registerFactory<GetAllFieldsMandatoryUseCase>(
      () => GetAllFieldsMandatoryUseCase(injector()));
  injector.registerFactory<PayslipUseCase>(() => PayslipUseCase(injector()));
  injector.registerFactory<GetEmployerIdUseCase>(
      () => GetEmployerIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<CalculateInCaseLoanUseCase>(
      () => CalculateInCaseLoanUseCase(injector()));
  injector.registerFactory<
          GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase>(
      () => GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase(injector()));
  injector.registerFactory<CalculateInCaseNewLeaveUseCase>(
      () => CalculateInCaseNewLeaveUseCase(injector()));
  injector.registerFactory<CalculateInCaseShortLeaveUseCase>(
      () => CalculateInCaseShortLeaveUseCase(injector()));
  injector.registerFactory<CalculateInCaseLeaveEncashmentUseCase>(
      () => CalculateInCaseLeaveEncashmentUseCase(injector()));
}
