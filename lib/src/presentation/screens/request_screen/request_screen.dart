import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/presentation/blocs/request/request_bloc.dart';
import 'package:talent_link/src/presentation/screens/request_screen/skeleton/request_skeleton_widget.dart';
import 'package:talent_link/src/presentation/screens/request_screen/widgets/request_card_item_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class RequestScreen extends BaseStatefulWidget {
  const RequestScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _RequestScreenState();
}

class _RequestScreenState extends BaseState<RequestScreen> {
  RequestBloc get _bloc => BlocProvider.of<RequestBloc>(context);
  List<Request> _requests = [];

  @override
  void initState() {
    _bloc.add(GetRequestsEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
        appBar: buildAppBarWidget(context,
            title: S.of(context).request, isHaveBackButton: false),
        body: BlocConsumer<RequestBloc, RequestState>(
          listener: (BuildContext context, state) {
            if (state is GetRequestsSuccessState) {
              _requests = state.requests;
            } else if (state is GetRequestsErrorState) {
            } else if (state is NavigateToLeaveScreenState) {
              Navigator.pushNamed(context, Routes.leave);
            } else if (state is NavigateToShortLeaveScreenState) {
              Navigator.pushNamed(context, Routes.shortLeave);
            } else if (state is NavigateToLeaveEncashmentScreenState) {
              Navigator.pushNamed(context, Routes.leaveEncashment);
            } else if (state is NavigateToLoanScreenState) {
              Navigator.pushNamed(context, Routes.loans);
            } else if (state is NavigateToIndemnityScreenState) {
              Navigator.pushNamed(context, Routes.indemnityEncashment);
            } else if (state is NavigateToAirTicketScreenState) {
              Navigator.pushNamed(context, Routes.airTicket);
            } else if (state is NavigateToHalfDayLeaveScreenState) {
              Navigator.pushNamed(context, Routes.halfDayLeave);
            } else if (state is NavigateToResumeDutyScreenState) {
              Navigator.pushNamed(context, Routes.resumeDuty);
            } else if (state is NavigateToBusinessTripScreenState) {
              Navigator.pushNamed(context, Routes.businessTrip);
            } else if (state is NavigateToOtherRequestScreenState) {
              Navigator.pushNamed(context, Routes.otherRequest);
            }
          },
          builder: (BuildContext context, state) {
            if (state is GetRequestsSkeletonState) {
              return const RequestSkeletonWidget();
            }
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              padding: const EdgeInsets.all(16),
              children: _requests.map((e) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: RequestCardItemWidget(
                      request: e,
                      onTapItem: () {
                        _bloc.add(NavigateToRequestsDetailsScreen(request: e));
                      },
                    ));
              }).toList(),
            );
          },
        ));
  }
}
