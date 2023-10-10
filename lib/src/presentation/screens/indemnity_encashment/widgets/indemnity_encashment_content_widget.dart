import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/indemnity_encashment/indemnity_encashment.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_global_key.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/map_indemnity_ecashment_to_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';

class IndemnityEncashmentContentWidget extends StatefulWidget {
  final IndemnityEncashmentController indemnityEncashmentController;
  final IndemnityEncashmentGlobalKey indemnityEncashmentGlobalKey;
  final IndemnityEncashmentErrorMassage indemnityEncashmentErrorMassage;
  final IndemnityEncashmentFunctions indemnityEncashmentFunctions;
  final List<IndemnityEncashment> indemnitiesEncashment;
  final bool isValidLeaveRemarks;

  final bool fileIsMandatory;

  final String filePath;

  const IndemnityEncashmentContentWidget({
    super.key,
    required this.indemnityEncashmentController,
    required this.indemnityEncashmentGlobalKey,
    required this.indemnityEncashmentErrorMassage,
    required this.indemnityEncashmentFunctions,
    required this.indemnitiesEncashment,
    required this.isValidLeaveRemarks,
    required this.fileIsMandatory,
    required this.filePath,
  });

  @override
  State<IndemnityEncashmentContentWidget> createState() =>
      _IndemnityEncashmentContentWidgetState();
}

class _IndemnityEncashmentContentWidgetState
    extends State<IndemnityEncashmentContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).requestedDate,
              globalKey: widget.indemnityEncashmentGlobalKey.requestedDate,
              errorMassage:
                  widget.indemnityEncashmentErrorMassage.requestedDate,
              pickDate: (value) => widget.indemnityEncashmentFunctions
                  .onPickRequestedDate(value),
              deleteDate: widget
                  .indemnityEncashmentFunctions.onDeleteRequestedDateAction,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              hasMaxDays: true,
              maxDays: '80',
              title: S.of(context).requestedDays,
              globalKey: widget.indemnityEncashmentGlobalKey.requestedDays,
              onChange: (value) => widget.indemnityEncashmentFunctions
                  .onChangeRequestedDays(value),
              controller: widget.indemnityEncashmentController.requestedDays,
              errorMassage:
                  widget.indemnityEncashmentErrorMassage.requestedDays,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).paymentMonth,
              globalKey: widget.indemnityEncashmentGlobalKey.paymentMonth,
              errorMassage: widget.indemnityEncashmentErrorMassage.paymentMonth,
              pickDate: (value) =>
                  widget.indemnityEncashmentFunctions.onPickPaymentMonth(value),
              deleteDate: widget
                  .indemnityEncashmentFunctions.onDeletePaymentMonthAction,
            ),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
                onSelectAction: (value) => widget.indemnityEncashmentFunctions
                    .onSelectRadioButton(value)),
            const SizedBox(height: 20),
            CustomDropdownTextFieldWithLabelWidget(
              controller: widget.indemnityEncashmentController.paymentMethod,
              errorMessage:
                  widget.indemnityEncashmentErrorMassage.paymentMethod,
              globalKey: widget.indemnityEncashmentGlobalKey.paymentMethod,
              title: S.of(context).paymentMethod,
              onTap: widget.indemnityEncashmentFunctions.onTapPaymentMethod,
            ),
          ]),
          CustomCardWidget(
              widget: mapIndemnityEncashmentToWidgets(
                  indemnitiesEncashment: widget.indemnitiesEncashment,
                  context: context,
                  indemnityEncashmentGlobalKey:
                      widget.indemnityEncashmentGlobalKey,
                  indemnityEncashmentErrorMassage:
                      widget.indemnityEncashmentErrorMassage,
                  indemnityEncashmentFunctions:
                      widget.indemnityEncashmentFunctions,
                  indemnityEncashmentController:
                      widget.indemnityEncashmentController,
                  isValidLeaveRemarks: widget.isValidLeaveRemarks,
                  fileIsMandatory: widget.fileIsMandatory,
                  filePath: widget.filePath)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.indemnityEncashmentFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
