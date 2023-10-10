import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_functions.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_global_key.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_text_controller.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/map_leave_to_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import '../../../widgets/custom_dropdown_text_field_with_label_widget.dart';

class LeaveContentWidget extends StatefulWidget {
  final String filePath;
  final bool checkBoxSelection;
  final bool isValidLeaveReasons;
  final bool isValidLeaveRemarks;
  final bool fileIsMandatory;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final LeaveGlobalKey leaveGlobalKey;
  final LeaveErrorMassage leaveErrorMassage;
  final LeaveFunctions leaveFunctions;
  final LeaveTextEditingController leaveTextEditingController;
  final bool isVisiblePaymentMethod;

  const LeaveContentWidget({
    super.key,
    required this.allFieldsMandatory,
    required this.leaveGlobalKey,
    required this.leaveErrorMassage,
    required this.leaveFunctions,
    required this.leaveTextEditingController,
    required this.checkBoxSelection,
    required this.isValidLeaveReasons,
    required this.isValidLeaveRemarks,
    required this.fileIsMandatory,
    required this.filePath,
    required this.isVisiblePaymentMethod,
  });

  @override
  State<LeaveContentWidget> createState() => _LeaveContentWidgetState();
}

class _LeaveContentWidgetState extends State<LeaveContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
                controller: widget.leaveTextEditingController.typeController,
                errorMessage: widget.leaveErrorMassage.typeErrorMassage,
                globalKey: widget.leaveGlobalKey.typeKey,
                title: S.of(context).type,
                onTap: widget.leaveFunctions.onTapType),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).startDate,
              globalKey: widget.leaveGlobalKey.startDateKey,
              errorMassage: widget.leaveErrorMassage.startDateErrorMassage,
              pickDate: (value) => widget.leaveFunctions.onPickStartDate(value),
              deleteDate: widget.leaveFunctions.onDeleteStartDateAction,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).endDate,
              globalKey: widget.leaveGlobalKey.endDateKey,
              errorMassage: widget.leaveErrorMassage.endDateErrorMassage,
              pickDate: (value) => widget.leaveFunctions.onPickEndDate(value),
              deleteDate: widget.leaveFunctions.onDeleteEndDateAction,
            ),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
              onSelectAction: (value) =>
                  widget.leaveFunctions.onSelectRadioButton(value),
            ),
            Visibility(
              visible: widget.isVisiblePaymentMethod,
              child: const SizedBox(height: 20),
            ),
            Visibility(
                visible: widget.isVisiblePaymentMethod,
                child: CustomDropdownTextFieldWithLabelWidget(
                  controller:
                      widget.leaveTextEditingController.paymentMethodController,
                  errorMessage:
                      widget.leaveErrorMassage.paymentMethodErrorMassage,
                  globalKey: widget.leaveGlobalKey.paymentMethodKey,
                  title: S.of(context).paymentMethod,
                  onTap: widget.leaveFunctions.onTapPaymentMethod,
                )),
          ]),
          widget.allFieldsMandatory.isNotEmpty
              ? CustomCardWidget(
                  widget: mapLeavesToWidgets(
                  allFieldsMandatory: widget.allFieldsMandatory,
                  context: context,
                  filePath: widget.filePath,
                  leaveGlobalKey: widget.leaveGlobalKey,
                  leaveFunctions: widget.leaveFunctions,
                  fileIsMandatory: widget.fileIsMandatory,
                  leaveErrorMassages: widget.leaveErrorMassage,
                  checkBoxSelection: widget.checkBoxSelection,
                  isValidLeaveReasons: widget.isValidLeaveReasons,
                  isValidLeaveRemarks: widget.isValidLeaveRemarks,
                  leaveTextEditingController: widget.leaveTextEditingController,
                ))
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.leaveFunctions.onTapSubmit,
            ),
          )
        ],
      ),
    );
  }
}
