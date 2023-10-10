import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket/air_ticket_bloc.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_controller.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_error_massage.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_functions.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_global_key.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/widgets/air_ticket_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';

class AirTicketScreen extends BaseStatefulWidget {
  const AirTicketScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AirTicketScreenState();
}

class _AirTicketScreenState extends BaseState<AirTicketScreen> {
  AirTicketBloc get _bloc => BlocProvider.of<AirTicketBloc>(context);
  final AirTicketErrorMassage _airTicketErrorMassage = AirTicketErrorMassage();
  final AirTicketController _airTicketController = AirTicketController(
      requestedDate:
          TextEditingController(text: DateTime.now().toString().split(" ")[0]),
      airTicketDueMonth: TextEditingController(),
      airTicketDueYear: TextEditingController(),
      paymentMethod: TextEditingController());
  final AirTicketGlobalKey _airTicketGlobalKey = AirTicketGlobalKey(
      requestedDate: GlobalKey(),
      airTicketDueMonth: GlobalKey(),
      airTicketDueYear: GlobalKey(),
      paymentMethod: GlobalKey());

  final List<AirTicket> _airTickets = [
    AirTicket(
        id: "#",
        dependent: "Dependent",
        ticketAmount: "Ticket amount",
        destination: "Destination"),
    AirTicket(
        id: "1",
        dependent: "dsdsdsds",
        ticketAmount: "0",
        destination: "Egypt"),
    AirTicket(
        id: "2",
        dependent: "dsdsdsds",
        ticketAmount: "0",
        destination: "Egypt"),
  ];
  List<RequestPaymentMethod> _airTicketPaymentMethods = [];
  RequestPaymentMethod _airTicketPaymentMethod =
      RequestPaymentMethod(id: 0, name: '');
  bool _visiblePaymentMethod = false;

  @override
  void initState() {
    _airTicketPaymentMethods = _bloc.airTicketPaymentMethods;
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AirTicketBloc, AirTicketState>(
      listener: (context, state) {
        if (state is AirTicketLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is AirTicketBackState) {
          Navigator.pop(context);
        } else if (state is AirTicketOpenPaymentMethodBottomSheetState) {
          _openPaymentMethodBottomSheet();
        } else if (state is AirTicketSelectPaymentMethodState) {
          _airTicketController.paymentMethod.text = state.paymentMethod.name;
        } else if (state is AirTicketShowPaymentMethodTextFieldState) {
          _visiblePaymentMethod = state.visiblePaymentMethod;
          _airTicketPaymentMethod = RequestPaymentMethod(id: 0, name: '');
          _airTicketController.paymentMethod.text = '';
          _airTicketErrorMassage.paymentMethod = null;
        } else if (state is AirTicketValidationPaymentMethodEmptyState) {
          _airTicketErrorMassage.paymentMethod = state.validationMassage;
          _animateTo(_airTicketGlobalKey.paymentMethod);
        } else if (state is AirTicketValidationPaymentMethodValidState) {
          _airTicketErrorMassage.paymentMethod = null;
        } else if (state is AirTicketSubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(AirTicketBackEvent());
            _bloc.add(AirTicketBackEvent());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).airTicket,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(AirTicketBackEvent());
          }),
          body: AirTicketContentWidget(
            airTicketErrorMassage: _airTicketErrorMassage,
            airTicketController: _airTicketController,
            airTicketGlobalKey: _airTicketGlobalKey,
            airTicketFunctions: AirTicketFunctions(
                onPickRequestedDate: (value) {},
                onTapAirTicketDueMonth: () {},
                onTapAirTicketDueYear: () {},
                onDeleteRequestedDate: () {},
                onSelectRadioButton: (SingleSelectionModel item) {
                  _bloc.add(AirTicketShowPaymentMethodTextFieldEvent(
                      singleSelectionModel: item));
                },
                onTapPaymentMethod: () {
                  _bloc.add(AirTicketOpenPaymentMethodBottomSheetEvent());
                },
                onTapSubmit: () {
                  _bloc.add(AirTicketSubmitEvent(
                      paymentMethod: _airTicketController.paymentMethod.text,
                      isVisiblePaymentMethod: _visiblePaymentMethod));
                }),
            airTickets: _airTickets,
            visiblePaymentMethod: _visiblePaymentMethod,
          ),
        );
      },
    );
  }

  void _openPaymentMethodBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _airTicketPaymentMethods,
        paymentMethod: _airTicketPaymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _airTicketPaymentMethod = value;
      _bloc.add(AirTicketSelectPaymentMethodEvent(
        paymentMethod: value,
      ));
    });
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }
}
