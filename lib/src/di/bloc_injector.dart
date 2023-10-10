import 'package:talent_link/src/presentation/blocs/air_ticket/air_ticket_bloc.dart';
import 'package:talent_link/src/presentation/blocs/business_trip/business_trip_bloc.dart';
import 'package:talent_link/src/presentation/blocs/half_day_leave/half_day_leave_bloc.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment/indemnity_encashment_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave/leave_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave_encashment/leave_encashment_bloc.dart';
import 'package:talent_link/src/presentation/blocs/loans/loans_bloc.dart';
import 'package:talent_link/src/presentation/blocs/other_request/other_request_bloc.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_bloc.dart';
import 'package:talent_link/src/presentation/blocs/request/request_bloc.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty/resume_duty_bloc.dart';
import 'package:talent_link/src/presentation/blocs/short_leave/short_leave_bloc.dart';

import 'data_layer_injector.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<RequestBloc>(() => RequestBloc(
        injector(),
      ));
  injector.registerFactory<LeaveBloc>(() => LeaveBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ShortLeaveBloc>(() => ShortLeaveBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<LeaveEncashmentBloc>(() => LeaveEncashmentBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector
      .registerFactory<IndemnityEncashmentBloc>(() => IndemnityEncashmentBloc(
            injector(),
            injector(),
          ));
  injector.registerFactory<LoansBloc>(() => LoansBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ResumeDutyBloc>(() => ResumeDutyBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<HalfDayLeaveBloc>(() => HalfDayLeaveBloc(
        injector(),
        injector(),
      ));

  injector
      .registerFactory<BusinessTripBloc>(() => BusinessTripBloc(injector()));
  injector.registerFactory<AirTicketBloc>(() => AirTicketBloc(injector()));
  injector.registerFactory<OtherRequestBloc>(
      () => OtherRequestBloc(injector(), injector()));
  injector
      .registerFactory<PayslipBloc>(() => PayslipBloc(injector(), injector()));
}
