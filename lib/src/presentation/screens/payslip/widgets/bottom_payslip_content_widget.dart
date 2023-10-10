import 'package:flutter/material.dart';
import 'package:talent_link/generated/assets.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/response_content_widget.dart';

class BottomPaySlipContentWidget extends StatefulWidget {
  PayslipModel payslip;
  BottomPaySlipContentWidget({super.key, required this.payslip});

  @override
  State<BottomPaySlipContentWidget> createState() =>
      _BottomPaySlipContentWidgetState();
}

class _BottomPaySlipContentWidgetState
    extends State<BottomPaySlipContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(230, 58, 45, 0.08),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        child: Card(
          elevation: 0.0,
          shadowColor: Colors.white,
          child: Column(
            children: [
              ResponseContentWidget(
                asset: Assets.dollers,
                text: "Basic Salary",
                value: widget.payslip.basicSalary,
              ),
              ResponseContentWidget(
                asset: Assets.arrow,
                text: "Housing Allowance",
                value: widget.payslip.hour,
              ),
              ResponseContentWidget(
                asset: Assets.blus,
                text: "Additions",
                value: widget.payslip.additions,
              ),
              ResponseContentWidget(
                asset: Assets.diffMinus,
                text: "Decuted",
                value: widget.payslip.decuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
