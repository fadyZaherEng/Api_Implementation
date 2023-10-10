import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_controller.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_error_massage.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_functions.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_with_prefix_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

class DestinationStepWidget extends StatefulWidget {
  final BusinessTripController businessTripController;
  final BusinessErrorMassage businessErrorMassage;
  final BusinessTripFunctions businessTripFunctions;
  final BusinessTripGlobalKey businessTripGlobalKey;
  final bool fileIsMandatory;
  final String filePath;
  final bool isValidRemarks;
  final bool isSelectedVisaRequired;

  const DestinationStepWidget({
    super.key,
    required this.businessErrorMassage,
    required this.businessTripGlobalKey,
    required this.businessTripFunctions,
    required this.filePath,
    required this.businessTripController,
    required this.fileIsMandatory,
    required this.isValidRemarks,
    required this.isSelectedVisaRequired,
  });

  @override
  State<DestinationStepWidget> createState() => _DestinationStepWidgetState();
}

class _DestinationStepWidgetState extends State<DestinationStepWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(S.of(context).destination,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorSchemes.black)),
                ],
              ),
            ),
            CustomCardWidget(widget: [
              CustomDropdownTextFieldWithLabelWidget(
                  controller: widget.businessTripController.country,
                  errorMessage: widget.businessErrorMassage.country,
                  globalKey: widget.businessTripGlobalKey.country,
                  title: S.of(context).country,
                  onTap: widget.businessTripFunctions.onTapCountry),
              const SizedBox(height: 20),
              CustomDropdownTextFieldWithLabelWidget(
                  controller: widget.businessTripController.city,
                  errorMessage: widget.businessErrorMassage.city,
                  globalKey: widget.businessTripGlobalKey.city,
                  title: S.of(context).city,
                  onTap: widget.businessTripFunctions.onTapCity),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                  title: S.of(context).flightDate,
                  value: widget.businessTripController.flightDate.text,
                  globalKey: widget.businessTripGlobalKey.flightDate,
                  errorMassage: widget.businessErrorMassage.flightDate,
                  pickDate: (value) =>
                      widget.businessTripFunctions.onPickFlightDate(value),
                  deleteDate: widget.businessTripFunctions.onDeleteFlightDate),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButtonWithPrefixWidget(
                    width: widget.isSelectedVisaRequired ? 157 : 130,
                    onTap: widget.businessTripFunctions.onTapVisaRequired,
                    buttonTitle: S.of(context).visaRequired,
                    isSelected: widget.isSelectedVisaRequired,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomNumericTextFieldWithLabelWidget(
                  title: S.of(context).visaAmount,
                  globalKey: widget.businessTripGlobalKey.visaAmount,
                  onChange: (value) =>
                      widget.businessTripFunctions.onChangeVisaAmount(value),
                  controller: widget.businessTripController.visaAmount,
                  errorMassage: widget.businessErrorMassage.visaAmount),
              const SizedBox(height: 20),
              CustomNumericTextFieldWithLabelWidget(
                  title: S.of(context).ticketAmount,
                  globalKey: widget.businessTripGlobalKey.ticketAmount,
                  onChange: (value) =>
                      widget.businessTripFunctions.onChangeTicketAmount(value),
                  controller: widget.businessTripController.ticketAmount,
                  errorMassage: widget.businessErrorMassage.ticketAmount),
              const SizedBox(height: 20),
              CustomNumericTextFieldWithLabelWidget(
                  title: S.of(context).hotelAmount,
                  globalKey: widget.businessTripGlobalKey.hotelAmount,
                  onChange: (value) =>
                      widget.businessTripFunctions.onChangeHotelAmount(value),
                  controller: widget.businessTripController.hotelAmount,
                  errorMassage: widget.businessErrorMassage.hotelAmount),
              const SizedBox(height: 20),
              CustomNumericTextFieldWithLabelWidget(
                  title: S.of(context).perDiemAmount,
                  globalKey: widget.businessTripGlobalKey.perDiemAmount,
                  onChange: (value) =>
                      widget.businessTripFunctions.onChangePerDiemAmount(value),
                  controller: widget.businessTripController.perDiemAmount,
                  errorMassage: widget.businessErrorMassage.perDiemAmount),
              const SizedBox(height: 20),
              RemarkTextFieldWidget(
                  isRemarkValid: widget.isValidRemarks,
                  remarkController: widget.businessTripController.remarks,
                  onRemarkChanged: (String value) =>
                      widget.businessTripFunctions.onChangeRemarks(value),
                  text: S.of(context).remarks,
                  errorMassage: widget.businessErrorMassage.remarks,
                  globalKey: widget.businessTripGlobalKey.remarks),
              const SizedBox(height: 20),
              UploadFileWidget(
                  filePath: widget.filePath,
                  showUploadFileBottomSheet:
                      widget.businessTripFunctions.showUploadFileBottomSheet,
                  deleteFileAction: (String filePath) =>
                      widget.businessTripFunctions..deleteFileAction(filePath),
                  globalKey: widget.businessTripGlobalKey.file,
                  isMandatory: widget.fileIsMandatory,
                  fileErrorMassage: widget.businessErrorMassage.file),
            ]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomGradientButtonWidget(
                  text: S.of(context).add,
                  onTap: widget.businessTripFunctions.onTapAdd),
            )
          ])),
    );
  }
}
