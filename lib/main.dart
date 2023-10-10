import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/config/theme/app_theme.dart';
import 'package:talent_link/src/core/utils/device_information.dart';
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
import 'package:talent_link/src/presentation/screens/bottom_navigation_bar/bottom_navigation_bar_screen.dart';

import 'src/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await DeviceInformation().initPlatformState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RequestBloc>(create: (context) => injector()),
          BlocProvider<LeaveBloc>(create: (context) => injector()),
          BlocProvider<ShortLeaveBloc>(create: (context) => injector()),
          BlocProvider<LeaveEncashmentBloc>(create: (context) => injector()),
          BlocProvider<IndemnityEncashmentBloc>(
              create: (context) => injector()),
          BlocProvider<LoansBloc>(create: (context) => injector()),
          BlocProvider<ResumeDutyBloc>(create: (context) => injector()),
          BlocProvider<HalfDayLeaveBloc>(create: (context) => injector()),
          BlocProvider<BusinessTripBloc>(create: (context) => injector()),
          BlocProvider<AirTicketBloc>(create: (context) => injector()),
          BlocProvider<OtherRequestBloc>(create: (context) => injector()),
          BlocProvider<PayslipBloc>(create: (context) => injector()),
        ],
        child: MaterialApp(
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.main,
          title: 'TalentLink_HR',
          theme: AppTheme("en").light,
          home: const BottomNavigationBarScreen(),
        ));
  }
}
