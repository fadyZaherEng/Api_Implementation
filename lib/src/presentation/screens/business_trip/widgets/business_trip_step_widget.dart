import 'package:flutter/widgets.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_controller.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_error_massage.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_functions.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';

class BusinessTripStepWidget extends StatefulWidget {
  final BusinessTripController businessTripController;
  final BusinessErrorMassage businessErrorMassage;
  final BusinessTripFunctions businessTripFunctions;
  final BusinessTripGlobalKey businessTripGlobalKey;
  final bool isValidTripPurpose;
  final bool paymentVisible;

  const BusinessTripStepWidget({
    super.key,
    required this.businessTripFunctions,
    required this.businessTripGlobalKey,
    required this.businessErrorMassage,
    required this.businessTripController,
    required this.isValidTripPurpose,
    required this.paymentVisible,
  });

  @override
  State<BusinessTripStepWidget> createState() =>
      _BusinessTripStepWidgetState();
}

class _BusinessTripStepWidgetState
    extends State<BusinessTripStepWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            CustomCardWidget(widget: [
              CustomDropdownTextFieldWithLabelWidget(
                controller: widget.businessTripController.businessTripType,
                errorMessage: widget.businessErrorMassage.businessTripType,
                globalKey: widget.businessTripGlobalKey.businessTripType,
                title: S.of(context).businessTripType,
                onTap: widget.businessTripFunctions.onTapBusinessTripType,
              ),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                value: widget.businessTripController.departureDate.text,
                title: S.of(context).departureDate,
                globalKey: widget.businessTripGlobalKey.departureDate,
                errorMassage: widget.businessErrorMassage.departureDate,
                pickDate: (value) =>
                    widget.businessTripFunctions.onPickDepartureDate(value),
                deleteDate: widget.businessTripFunctions.onDeleteDepartureDate,
              ),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                value: widget.businessTripController.returnDate.text,
                title: S.of(context).returnDate,
                globalKey: widget.businessTripGlobalKey.returnDate,
                errorMassage: widget.businessErrorMassage.returnDate,
                pickDate: (value) =>
                    widget.businessTripFunctions.onPickReturnDate(value),
                deleteDate: widget.businessTripFunctions.onDeleteReturnDate,
              ),
              const SizedBox(height: 20),
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).duration,
                globalKey: widget.businessTripGlobalKey.duration,
                onChange: (value) =>
                    widget.businessTripFunctions.onChangeDuration(value),
                controller: widget.businessTripController.duration,
                errorMassage: widget.businessErrorMassage.duration,
              ),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                value:
                    widget.businessTripController.expectedResumeDutyDate.text,
                title: S.of(context).expectedResumeDutyDate,
                globalKey: widget.businessTripGlobalKey.expectedResumeDutyDate,
                errorMassage:
                    widget.businessErrorMassage.expectedResumeDutyDate,
                pickDate: (value) => widget.businessTripFunctions
                    .onPickExpectedResumeDutyDate(value),
                deleteDate:
                    widget.businessTripFunctions.onDeleteExpectedResumeDutyDate,
              ),
              const SizedBox(height: 20),
              CustomRadioButtonsWidget(
                onSelectAction: (value) =>
                    widget.businessTripFunctions.onSelectRadioButton(value),
              ),
              Visibility(
                  visible: widget.paymentVisible,
                  child: const SizedBox(height: 20)),
              Visibility(
                visible: widget.paymentVisible,
                child: CustomDropdownTextFieldWithLabelWidget(
                  controller: widget.businessTripController.paymentMethod,
                  errorMessage: widget.businessErrorMassage.paymentMethod,
                  globalKey: widget.businessTripGlobalKey.paymentMethod,
                  title: S.of(context).paymentMethod,
                  onTap: widget.businessTripFunctions.onTapPaymentMethod,
                ),
              ),
              const SizedBox(height: 20),
              CustomDateTextFieldWithLabelWidget(
                value: widget.businessTripController.actualResumeDutyDate.text,
                title: S.of(context).actualResumeDutyDate,
                globalKey: widget.businessTripGlobalKey.actualResumeDutyDate,
                errorMassage: widget.businessErrorMassage.actualResumeDutyDate,
                pickDate: (value) => widget.businessTripFunctions
                    .onPickActualResumeDutyDate(value),
                deleteDate:
                    widget.businessTripFunctions.onDeleteActualResumeDutyDate,
              ),
              const SizedBox(height: 20),
              RemarkTextFieldWidget(
                isRemarkValid: widget.isValidTripPurpose,
                remarkController: widget.businessTripController.tripPurpose,
                onRemarkChanged: (String value) =>
                    widget.businessTripFunctions.onChangeTripPurpose(value),
                text: S.of(context).tripPurpose,
                errorMassage: widget.businessErrorMassage.tripPurpose,
                globalKey: widget.businessTripGlobalKey.tripPurpose,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomGradientButtonWidget(
                text: S.of(context).next,
                onTap: widget.businessTripFunctions.onTapNext,
              ),
            )
          ])),
    );
  }
}
