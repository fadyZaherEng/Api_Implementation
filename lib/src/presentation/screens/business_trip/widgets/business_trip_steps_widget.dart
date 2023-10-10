import 'package:flutter/material.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_functions.dart';

import '../../../../config/theme/color_schemes.dart';

class BusinessTripStepsWidget extends StatelessWidget {
  final BusinessTripFunctions businessTripFunctions;
  final int stepId;

  const BusinessTripStepsWidget({
    Key? key,
    required this.businessTripFunctions,
    required this.stepId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24,left: 24,top: 16),
      child: Row(
        children: [
          InkWell(
            onTap:  businessTripFunctions.onTapBusinessTripStep,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorSchemes.primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '1',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomPaint(
              painter: DottedLinePainter(stepId: stepId),
              child: Container(),
            ),
          ),
          InkWell(
            onTap:  businessTripFunctions.onTapDestinationStep,
            child: Container(
              decoration: BoxDecoration(
                color: stepId == 2 ? ColorSchemes.primary : ColorSchemes.border,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  '2',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: stepId == 2
                          ? ColorSchemes.white
                          : ColorSchemes.sameBlack),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final int stepId;

  DottedLinePainter({required this.stepId});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = stepId == 1 ? ColorSchemes.border : ColorSchemes.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    const double dashWidth = 6;
    const double dashSpace = 4;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
