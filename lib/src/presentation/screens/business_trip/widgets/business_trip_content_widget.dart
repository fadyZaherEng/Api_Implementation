import 'package:flutter/material.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_controller.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_error_massage.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_functions.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_global_key.dart';
import 'package:talent_link/src/presentation/screens/business_trip/widgets/business_trip_step_widget.dart';
import 'package:talent_link/src/presentation/screens/business_trip/widgets/destination_step_widget.dart';
import 'package:talent_link/src/presentation/screens/business_trip/widgets/business_trip_steps_widget.dart';

class BusinessTripContentWidget extends StatefulWidget {
  final BusinessTripController businessTripController;
  final BusinessErrorMassage businessErrorMassage;
  final BusinessTripFunctions businessTripFunctions;
  final BusinessTripGlobalKey businessTripGlobalKey;
  final bool isValidTripPurpose;
  final bool isValidRemarks;
  final bool fileIsMandatory;
  final String filePath;
  final int stepID;
  final bool paymentVisible;
  final bool isSelectedVisaRequired;

  const BusinessTripContentWidget({
    super.key,
    required this.businessErrorMassage,
    required this.businessTripGlobalKey,
    required this.businessTripController,
    required this.businessTripFunctions,
    required this.isValidTripPurpose,
    required this.isValidRemarks,
    required this.filePath,
    required this.fileIsMandatory,
    required this.stepID,
    required this.paymentVisible,
    required this.isSelectedVisaRequired,
  });

  @override
  State<BusinessTripContentWidget> createState() =>
      _BusinessTripContentWidgetState();
}

class _BusinessTripContentWidgetState extends State<BusinessTripContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BusinessTripStepsWidget(
            businessTripFunctions: widget.businessTripFunctions,
            stepId: widget.stepID),
        widget.stepID == 1
            ? BusinessTripStepWidget(
                paymentVisible: widget.paymentVisible,
                businessTripFunctions: widget.businessTripFunctions,
                businessTripGlobalKey: widget.businessTripGlobalKey,
                businessErrorMassage: widget.businessErrorMassage,
                businessTripController: widget.businessTripController,
                isValidTripPurpose: widget.isValidTripPurpose)
            : DestinationStepWidget(
                businessErrorMassage: widget.businessErrorMassage,
                businessTripGlobalKey: widget.businessTripGlobalKey,
                businessTripFunctions: widget.businessTripFunctions,
                filePath: widget.filePath,
                businessTripController: widget.businessTripController,
                fileIsMandatory: widget.fileIsMandatory,
                isValidRemarks: widget.isValidRemarks,
                isSelectedVisaRequired: widget.isSelectedVisaRequired,
              )
      ],
    );
  }
}
