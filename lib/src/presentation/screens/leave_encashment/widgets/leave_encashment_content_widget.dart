import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_global_key.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/map_leave_encashment_to_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';

class LeaveEncashmentContentWidget extends StatefulWidget {
  final String filePath;
  final bool checkBoxSelection;
  final bool isValidLeaveRemarks;
  final bool fileIsMandatory;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final LeaveEncashmentGlobalKey leaveEncashmentGlobalKey;
  final LeaveEncashmentErrorMassage leaveEncashmentErrorMassage;
  final LeaveEncashmentFunctions leaveEncashmentFunctions;
  final LeaveEncashmentController leaveEncashmentController;
  final bool isVisiblePaymentMethod;

  const LeaveEncashmentContentWidget({
    super.key,
    required this.filePath,
    required this.checkBoxSelection,
    required this.isValidLeaveRemarks,
    required this.fileIsMandatory,
    required this.allFieldsMandatory,
    required this.leaveEncashmentGlobalKey,
    required this.leaveEncashmentErrorMassage,
    required this.leaveEncashmentFunctions,
    required this.leaveEncashmentController,
    required this.isVisiblePaymentMethod,
  });

  @override
  State<LeaveEncashmentContentWidget> createState() =>
      _LeaveEncashmentContentWidgetState();
}

class _LeaveEncashmentContentWidgetState
    extends State<LeaveEncashmentContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
                controller: widget.leaveEncashmentController.type,
                errorMessage: widget.leaveEncashmentErrorMassage.type,
                globalKey: widget.leaveEncashmentGlobalKey.type,
                title: S.of(context).type,
                onTap: widget.leaveEncashmentFunctions.onTapType),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).requestedDate,
              globalKey: widget.leaveEncashmentGlobalKey.requestedDate,
              errorMassage: widget.leaveEncashmentErrorMassage.requestedDate,
              pickDate: (value) =>
                  widget.leaveEncashmentFunctions.onPickRequestedDate(value),
              deleteDate:
                  widget.leaveEncashmentFunctions.onDeleteRequestedDateAction,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              title: S.of(context).requestedDays,
              globalKey: widget.leaveEncashmentGlobalKey.requestedDays,
              onChange: (value) =>
                  widget.leaveEncashmentFunctions.onChangeRequestedDays(value),
              controller: widget.leaveEncashmentController.requestedDays,
              errorMassage: widget.leaveEncashmentErrorMassage.requestedDays,
            ),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
                onSelectAction: (value) =>
                    widget.leaveEncashmentFunctions.onSelectRadioButton(value)),
            Visibility(
                visible: widget.isVisiblePaymentMethod,
                child: const SizedBox(height: 20)),
            Visibility(
              visible: widget.isVisiblePaymentMethod,
              child: CustomDropdownTextFieldWithLabelWidget(
                controller: widget.leaveEncashmentController.paymentMethod,
                errorMessage: widget.leaveEncashmentErrorMassage.paymentMethod,
                globalKey: widget.leaveEncashmentGlobalKey.paymentMethod,
                title: S.of(context).paymentMethod,
                onTap: widget.leaveEncashmentFunctions.onTapPaymentMethod,
              ),
            ),
            const SizedBox(height: 20),
          ]),
          widget.allFieldsMandatory.isNotEmpty
              ? CustomCardWidget(
                  widget: mapLeavesEncashmentToWidgets(
                      allFieldsMandatory: widget.allFieldsMandatory,
                      context: context,
                      leaveEncashmentGlobalKey: widget.leaveEncashmentGlobalKey,
                      leaveEncashmentErrorMassage:
                          widget.leaveEncashmentErrorMassage,
                      leaveEncashmentFunctions: widget.leaveEncashmentFunctions,
                      leaveEncashmentController:
                          widget.leaveEncashmentController,
                      checkBoxSelection: widget.checkBoxSelection,
                      isValidRemarks: widget.isValidLeaveRemarks,
                      fileIsMandatory: widget.fileIsMandatory,
                      filePath: widget.filePath))
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.leaveEncashmentFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
