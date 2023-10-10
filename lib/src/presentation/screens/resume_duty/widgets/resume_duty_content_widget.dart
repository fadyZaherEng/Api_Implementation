import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/resume_duty/resume_duty.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/map_resume_duty_to_widget.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_error_msssage.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_functions.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';

class ResumeDutyContentWidget extends StatefulWidget {
  final List<ResumeDuty> resumeDuties;
  final bool isValidLeaveRemarks;
  final bool fileIsMandatory;
  final String filePath;
  final ResumeDutyController resumeDutyController;
  final ResumeDutyErrorMassage resumeDutyErrorMassage;
  final ResumeDutyGlobalKey resumeDutyGlobalKey;
  final ResumeDutyFunctions resumeDutyFunctions;
  final bool isVisiblePaymentMethod;

  const ResumeDutyContentWidget({
    super.key,
    required this.resumeDuties,
    required this.isValidLeaveRemarks,
    required this.fileIsMandatory,
    required this.filePath,
    required this.resumeDutyController,
    required this.resumeDutyErrorMassage,
    required this.resumeDutyGlobalKey,
    required this.resumeDutyFunctions,
    required this.isVisiblePaymentMethod,
  });

  @override
  State<ResumeDutyContentWidget> createState() =>
      _ResumeDutyContentWidgetState();
}

class _ResumeDutyContentWidgetState extends State<ResumeDutyContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
              controller: widget.resumeDutyController.referenceType,
              errorMessage: widget.resumeDutyErrorMassage.referenceType,
              globalKey: widget.resumeDutyGlobalKey.referenceType,
              title: S.of(context).referenceType,
              onTap: widget.resumeDutyFunctions.onTapReferenceType,
            ),
            const SizedBox(height: 20),
            CustomDropdownTextFieldWithLabelWidget(
              controller: widget.resumeDutyController.referenceData,
              errorMessage: widget.resumeDutyErrorMassage.referenceData,
              globalKey: widget.resumeDutyGlobalKey.referenceData,
              title: S.of(context).referenceData,
              onTap: widget.resumeDutyFunctions.onTapReferenceData,
            ),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
              onSelectAction: (value) =>
                  widget.resumeDutyFunctions.onSelectRadioButton(value),
            ),
            Visibility(
                visible: widget.isVisiblePaymentMethod,
                child: const SizedBox(height: 20)),
            Visibility(
              visible: widget.isVisiblePaymentMethod,
              child: CustomDropdownTextFieldWithLabelWidget(
                controller: widget.resumeDutyController.paymentMethod,
                errorMessage: widget.resumeDutyErrorMassage.paymentMethod,
                globalKey: widget.resumeDutyGlobalKey.paymentMethod,
                title: S.of(context).paymentMethod,
                onTap: widget.resumeDutyFunctions.onTapPaymentMethod,
              ),
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).actualResumeDutyDate,
              globalKey: widget.resumeDutyGlobalKey.actualResumeDutyDate,
              errorMassage: widget.resumeDutyErrorMassage.actualResumeDutyDate,
              pickDate: (value) =>
                  widget.resumeDutyFunctions.onPickActualResumeDutyDate(value),
              deleteDate:
                  widget.resumeDutyFunctions.onDeleteActualResumeDutyDateAction,
            ),
          ]),
          CustomCardWidget(
              widget: mapResumeDutyToWidgets(
                  resumeDuties: widget.resumeDuties,
                  context: context,
                  resumeDutyGlobalKey: widget.resumeDutyGlobalKey,
                  resumeDutyErrorMassage: widget.resumeDutyErrorMassage,
                  resumeDutyFunctions: widget.resumeDutyFunctions,
                  resumeDutyController: widget.resumeDutyController,
                  isValidLeaveRemarks: widget.isValidLeaveRemarks,
                  fileIsMandatory: widget.fileIsMandatory,
                  filePath: widget.filePath)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.resumeDutyFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
