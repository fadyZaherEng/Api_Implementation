import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_controller.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_error_massage.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_functions.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_global_key.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/widgets/air_ticket_table_wisget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';

class AirTicketContentWidget extends StatefulWidget {
  final AirTicketErrorMassage airTicketErrorMassage;
  final AirTicketController airTicketController;
  final AirTicketGlobalKey airTicketGlobalKey;
  final AirTicketFunctions airTicketFunctions;
  final List<AirTicket> airTickets;
  final bool visiblePaymentMethod;

  const AirTicketContentWidget({
    super.key,
    required this.airTicketErrorMassage,
    required this.airTicketController,
    required this.airTicketGlobalKey,
    required this.airTicketFunctions,
    required this.airTickets,
    required this.visiblePaymentMethod,
  });

  @override
  State<AirTicketContentWidget> createState() => _AirTicketContentWidgetState();
}

class _AirTicketContentWidgetState extends State<AirTicketContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomCardWidget(widget: [
            CustomDateTextFieldWithLabelWidget(
              valueComingFromApi: true,
              value: widget.airTicketController.requestedDate.text,
              title: S.of(context).requestedDate,
              globalKey: widget.airTicketGlobalKey.requestedDate,
              errorMassage: widget.airTicketErrorMassage.requestedDate,
              pickDate: (value) =>
                  widget.airTicketFunctions.onPickRequestedDate(value),
              deleteDate: widget.airTicketFunctions.onDeleteRequestedDate,
            ),
            const SizedBox(height: 20),
            CustomDropdownTextFieldWithLabelWidget(
                controller: widget.airTicketController.airTicketDueMonth,
                errorMessage: widget.airTicketErrorMassage.airTicketDueMonth,
                globalKey: widget.airTicketGlobalKey.airTicketDueMonth,
                title: S.of(context).airTicketDueMonth,
                onTap: widget.airTicketFunctions.onTapAirTicketDueMonth),
            const SizedBox(height: 20),
            CustomDropdownTextFieldWithLabelWidget(
                controller: widget.airTicketController.airTicketDueYear,
                errorMessage: widget.airTicketErrorMassage.airTicketDueYear,
                globalKey: widget.airTicketGlobalKey.airTicketDueYear,
                title: S.of(context).airTicketDueYear,
                onTap: widget.airTicketFunctions.onTapAirTicketDueYear),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
              onSelectAction: (value) =>
                  widget.airTicketFunctions.onSelectRadioButton(value),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: widget.visiblePaymentMethod,
              child: CustomDropdownTextFieldWithLabelWidget(
                  controller: widget.airTicketController.paymentMethod,
                  errorMessage: widget.airTicketErrorMassage.paymentMethod,
                  globalKey: widget.airTicketGlobalKey.paymentMethod,
                  title: S.of(context).paymentMethod,
                  onTap: widget.airTicketFunctions.onTapPaymentMethod),
            ),
          ]),
          AirTicketTableWidget(airTickets: widget.airTickets),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.airTicketFunctions.onTapSubmit,
            ),
          )
        ],
      ),
    );
  }
}
