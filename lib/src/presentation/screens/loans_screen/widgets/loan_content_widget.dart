import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_controller.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_error_massage.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_functions.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_global_key.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/map_loans_to_widget.dart';
import 'package:talent_link/src/presentation/widgets/check_box_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';

class LoansContentWidget extends StatefulWidget {
  final LoansController loansController;
  final LoansErrorMassage loansErrorMassage;
  final LoansFunctions loansFunctions;
  final LoansGlobalKey loansGlobalKey;
  final bool checkBoxSelection;
  final bool fileIsMandatory;
  final bool isValidLeaveRemarks;
  final String filePath;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final bool isVisiblePaymentMethod;
  final List<TextInputFormatter>? installmentsFormatter;

  const LoansContentWidget({
    super.key,
    required this.loansFunctions,
    required this.loansGlobalKey,
    required this.loansErrorMassage,
    required this.loansController,
    required this.checkBoxSelection,
    required this.fileIsMandatory,
    required this.isValidLeaveRemarks,
    required this.filePath,
    required this.allFieldsMandatory,
    required this.isVisiblePaymentMethod,
    this.installmentsFormatter,
  });

  @override
  State<LoansContentWidget> createState() => _LoansContentWidgetState();
}

class _LoansContentWidgetState extends State<LoansContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          CustomCardWidget(widget: [
            CustomDropdownTextFieldWithLabelWidget(
              controller: widget.loansController.type,
              errorMessage: widget.loansErrorMassage.type,
              globalKey: widget.loansGlobalKey.type,
              title: S.of(context).type,
              onTap: widget.loansFunctions.onTapType,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).loanRequestedDate,
              globalKey: widget.loansGlobalKey.loanRequestedDate,
              errorMassage: widget.loansErrorMassage.loanRequestedDate,
              pickDate: (value) =>
                  widget.loansFunctions.onPickLoanRequestedDate(value),
              deleteDate: widget.loansFunctions.onDeleteLoanRequestedDateAction,
            ),
            const SizedBox(height: 20),
            CustomDateTextFieldWithLabelWidget(
              title: S.of(context).loanStartDate,
              globalKey: widget.loansGlobalKey.loanStartDate,
              errorMassage: widget.loansErrorMassage.loanStartDate,
              pickDate: (value) =>
                  widget.loansFunctions.onPickLoanStartDate(value),
              deleteDate: widget.loansFunctions.onDeleteLoanStartDateAction,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              title: S.of(context).loanRequestedAmount,
              globalKey: widget.loansGlobalKey.loanRequestedAmount,
              onChange: (value) =>
                  widget.loansFunctions.onChangeLoanRequestedAmount(value),
              controller: widget.loansController.loanRequestedAmount,
              errorMassage: widget.loansErrorMassage.loanRequestedAmount,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              title: S.of(context).profitRate,
              globalKey: widget.loansGlobalKey.profitRate,
              onChange: (value) =>
                  widget.loansFunctions.onChangeProfitRate(value),
              controller: widget.loansController.profitRate,
              errorMassage: widget.loansErrorMassage.profitRate,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              readOnly: true,
              title: S.of(context).loanTotalAmount,
              globalKey: widget.loansGlobalKey.loanTotalAmount,
              onChange: (value) =>
                  widget.loansFunctions.onChangeLoanTotalAmount(value),
              controller: widget.loansController.loanTotalAmount,
              errorMassage: widget.loansErrorMassage.loanTotalAmount,
            ),
            const SizedBox(height: 20),
            CheckboxWidget(
              title: S.of(context).byInstallmentAmount,
              isSelected: widget.checkBoxSelection,
              onTap: widget.loansFunctions.checkboxAction,
            ),
            const SizedBox(height: 20),
            CustomNumericTextFieldWithLabelWidget(
              inputFormatters: widget.installmentsFormatter,
              title: S.of(context).installments,
              globalKey: widget.loansGlobalKey.installments,
              onChange: (value) =>
                  widget.loansFunctions.onChangeInstallments(value),
              controller: widget.loansController.installments,
              errorMassage: widget.loansErrorMassage.installments,
            ),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
                onSelectAction: (value) =>
                    widget.loansFunctions.onSelectRadioButton(value)),
            Visibility(
                visible: widget.isVisiblePaymentMethod,
                child: const SizedBox(height: 20)),
            Visibility(
              visible: widget.isVisiblePaymentMethod,
              child: CustomDropdownTextFieldWithLabelWidget(
                controller: widget.loansController.paymentMethod,
                errorMessage: widget.loansErrorMassage.paymentMethod,
                globalKey: widget.loansGlobalKey.paymentMethod,
                title: S.of(context).paymentMethod,
                onTap: widget.loansFunctions.onTapPaymentMethod,
              ),
            ),
          ]),
          widget.allFieldsMandatory.isNotEmpty?CustomCardWidget(
              widget: mapLoansToWidgets(
                  allFieldsMandatory: widget.allFieldsMandatory,
                  context: context,
                  loansGlobalKey: widget.loansGlobalKey,
                  loansErrorMassage: widget.loansErrorMassage,
                  loansFunctions: widget.loansFunctions,
                  loansController: widget.loansController,
                  isValidLeaveRemarks: widget.isValidLeaveRemarks,
                  fileIsMandatory: widget.fileIsMandatory,
                  filePath: widget.filePath)):const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.loansFunctions.onTapSubmit,
            ),
          )
        ]));
  }
}
