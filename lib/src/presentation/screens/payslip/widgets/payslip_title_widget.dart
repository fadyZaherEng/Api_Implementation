import 'package:flutter/material.dart';

class PayslipTitleWidget extends StatelessWidget {
  const PayslipTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 22),
        child: Text(
          "PaySlip",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
    );
  }
}
