import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/other_rquest/other_rquest.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/map_other_request_to_widget.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_controller.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_error_massage.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_functions.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';

class OtherRequestContentWidget extends StatefulWidget {
  final List<OtherRequest> otherRequests;
  final bool isValidRemarks;
  final bool isValidNotes;
  final bool fileIsMandatory;
  final String filePath;
  final OtherRequestController otherRequestController;
  final OtherRequestErrorMassage otherRequestErrorMassage;
  final OtherRequestFunctions otherRequestFunctions;
  final OtherRequestGlobalKey otherRequestGlobalKey;

  const OtherRequestContentWidget({
    super.key,
    required this.otherRequests,
    required this.isValidRemarks,
    required this.isValidNotes,
    required this.fileIsMandatory,
    required this.filePath,
    required this.otherRequestGlobalKey,
    required this.otherRequestFunctions,
    required this.otherRequestErrorMassage,
    required this.otherRequestController,
  });

  @override
  State<OtherRequestContentWidget> createState() =>
      _OtherRequestContentWidgetState();
}

class _OtherRequestContentWidgetState extends State<OtherRequestContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(
            widget: [
              CustomDropdownTextFieldWithLabelWidget(
                controller: widget.otherRequestController.request,
                errorMessage: widget.otherRequestErrorMassage.request,
                globalKey: widget.otherRequestGlobalKey.request,
                title: S.of(context).request,
                onTap: widget.otherRequestFunctions.onTapRequest,
              ),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                title: S.of(context).requestedDate,
                globalKey: widget.otherRequestGlobalKey.requestedDate,
                errorMassage: widget.otherRequestErrorMassage.requestedDate,
                pickDate: (value) =>
                    widget.otherRequestFunctions.onPickRequestedDate(value),
                deleteDate: widget.otherRequestFunctions.onDeleteRequestedDate,
              ),
            ],
          ),
          CustomCardWidget(
            widget: mapOtherRequestToWidgets(
                otherRequests: widget.otherRequests,
                context: context,
                otherRequestGlobalKey: widget.otherRequestGlobalKey,
                otherRequestErrorMassage: widget.otherRequestErrorMassage,
                otherRequestFunctions: widget.otherRequestFunctions,
                otherRequestController: widget.otherRequestController,
                isValidRemarks: widget.isValidRemarks,
                isValidNotes: widget.isValidNotes,
                fileIsMandatory: widget.fileIsMandatory,
                filePath: widget.filePath),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.otherRequestFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
