import 'package:flutter/material.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/air_ticket_screen.dart';
import 'package:talent_link/src/presentation/screens/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:talent_link/src/presentation/screens/business_trip/business_trip_screen.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/half_day_leave_screen.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/indemnity_encashment_screen.dart';
import 'package:talent_link/src/presentation/screens/leave/leave_screen.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/leave_encashment_screen.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/loans_screen.dart';
import 'package:talent_link/src/presentation/screens/other_request/other_request_screen.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/resume_duty_screen.dart';
import 'package:talent_link/src/presentation/screens/short_leave/short_leave_screen.dart';

class Routes {
  static const String main = "/main";
  static const String leave = "/leave";
  static const String shortLeave = "/shortLeave";
  static const String leaveEncashment = "/leaveEncashment";
  static const String indemnityEncashment = "/indemnityEncashment";
  static const String loans = "/loans";
  static const String resumeDuty = "/resumeDuty";
  static const String halfDayLeave = "/halfDayLeave";
  static const String businessTrip = "/businessTrip";
  static const String airTicket = "/airTicket";
  static const String otherRequest = "/otherRequest";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.main:
        return _materialRoute(const BottomNavigationBarScreen());
      case Routes.leave:
        return _materialRoute(const LeaveScreen());
      case Routes.shortLeave:
        return _materialRoute(const ShortLeaveScreen());
      case Routes.leaveEncashment:
        return _materialRoute(const LeaveEncashmentScreen());
      case Routes.indemnityEncashment:
        return _materialRoute(const IndemnityEncashmentScreen());
      case Routes.loans:
        return _materialRoute(const LoansScreen());
      case Routes.resumeDuty:
        return _materialRoute(const ResumeDutyScreen());
      case Routes.halfDayLeave:
        return _materialRoute(const HalfDayLeaveScreen());
      case Routes.businessTrip:
        return _materialRoute(const BusinessTripScreen());
      case Routes.airTicket:
        return _materialRoute(const AirTicketScreen());
      case Routes.otherRequest:
        return _materialRoute(const OtherRequestScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: const Center(
          child: Text("Not found"),
        ),
      ),
    );
  }
}
