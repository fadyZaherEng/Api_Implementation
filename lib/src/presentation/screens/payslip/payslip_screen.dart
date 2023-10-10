// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_bloc.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_event.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_state.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/bottom_payslip_content_widget.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_sal_widget.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_title_widget.dart';

class PayslipScreen extends StatefulWidget {
  const PayslipScreen({super.key});

  @override
  State<PayslipScreen> createState() => _PayslipScreenState();
}

class _PayslipScreenState extends State<PayslipScreen> {
  PayslipModel? payslipModel;
  String selectDate =
      "${DateFormat.MMMM().format(DateTime.now()).toString()} ${DateTime.now().year}";

  PayslipBloc get _bloc => BlocProvider.of<PayslipBloc>(context);

  @override
  void initState() {
    _bloc.add(PayslipGetDataEvent(
      year: DateTime.now().year,
      month: DateTime.now().month,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayslipBloc, PayslipState>(
      listener: (context, state) {
        if (state is PayslipGetDataSuccessState) {
          payslipModel = state.payslipModel;
        }
        if (state is PayslipGetDataErrorState) {
          print(state.errorMSG);
        }
        if (state is PayslipSelectDateSuccessState) {
          selectDate = state.selectDate ??
              "${DateFormat.MMMM().format(DateTime.now()).toString()} ${DateTime.now().year}";
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ConditionalBuilder(
                condition: payslipModel != null,
                builder: (context) => SingleChildScrollView(
                      child: Column(
                        children: [
                          const PayslipTitleWidget(),
                          PayslipSalaryWidget(
                            salary: payslipModel!.salary,
                            onLeftArrowPressed: () {
                              _bloc.add(PayslipLeftArrowEvent());
                            },
                            onRightArrowPressed: () {
                              _bloc.add(PayslipRightArrowEvent());
                            },
                            onSelectDatePressed: () {
                              _bloc.add(PayslipSelectDateEvent(context));
                            },
                            selectDate: selectDate,
                          ),
                          BottomPaySlipContentWidget(
                            payslip: payslipModel!,
                          ),
                        ],
                      ),
                    ),
                fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    )),
          ),
        );
      },
    );
  }
}
