import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talent_link/generated/assets.dart';

class PayslipSalaryWidget extends StatefulWidget {
  double salary;
  void Function() onLeftArrowPressed;
  void Function() onRightArrowPressed;
  void Function() onSelectDatePressed;
  String selectDate;
  PayslipSalaryWidget({
    super.key,
    required this.salary,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
    required this.onSelectDatePressed,
    required this.selectDate,
  });

  @override
  State<PayslipSalaryWidget> createState() => _PayslipSalaryWidgetState();
}

class _PayslipSalaryWidgetState extends State<PayslipSalaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 213,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(230, 58, 45, 0.08),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: widget.onLeftArrowPressed,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromRGBO(235, 0, 27, 1),
                  )),
              const Spacer(),
              InkWell(
                onTap: widget.onSelectDatePressed,
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.calender),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.selectDate,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(235, 0, 27, 1),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: widget.onRightArrowPressed,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(235, 0, 27, 1),
                  )),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Container(
              height: 97,
              width: MediaQuery.sizeOf(context).width * 0.92,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(235, 0, 27, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Salary",
                      style: TextStyle(
                        color: Color.fromRGBO(238, 240, 246, 1),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${widget.salary.toString()} KWD",
                      style: const TextStyle(
                          fontSize: 28,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
