import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_global_key.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_text_controller.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_functions.dart';
import 'package:talent_link/src/presentation/widgets/check_box_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

import 'leave_error_massage.dart';

List<Widget> mapLeavesToWidgets({
  required List<AllFieldsMandatory> allFieldsMandatory,
  required BuildContext context,
  required LeaveGlobalKey leaveGlobalKey,
  required LeaveErrorMassage leaveErrorMassages,
  required LeaveFunctions leaveFunctions,
  required LeaveTextEditingController leaveTextEditingController,
  required bool checkBoxSelection,
  required bool isValidLeaveReasons,
  required bool isValidLeaveRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return allFieldsMandatory.map((allFieldsMandatory) {
    if (allFieldsMandatory.fieldKey == "expectedResumeDuty") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomDateTextFieldWithLabelWidget(
                title: S.of(context).expectedResumingDate,
                globalKey: leaveGlobalKey.expectedResumingDateKey,
                errorMassage:
                    leaveErrorMassages.expectedResumingDateErrorMassage,
                pickDate: (value) => leaveFunctions.onPickExpectedResumingDate(
                    value, allFieldsMandatory.isRequired),
                deleteDate: () =>
                    leaveFunctions.onDeletePickExpectedResumingDateAction(
                        allFieldsMandatory.isRequired),
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "emergencyContactNo") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).contactNo,
                globalKey: leaveGlobalKey.contactNoKey,
                onChange: (value) => leaveFunctions.onChangeContactNo(
                    value, allFieldsMandatory.isRequired),
                controller: leaveTextEditingController.contactNoController,
                errorMassage: leaveErrorMassages.contactNoErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "addressDuringLeave") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).addressDuringLeave,
                globalKey: leaveGlobalKey.addressDuringLeaveKey,
                onChange: (value) => leaveFunctions.onChangeAddressDuringLeave(
                    value, allFieldsMandatory.isRequired),
                controller:
                    leaveTextEditingController.addressDuringLeaveController,
                errorMassage: leaveErrorMassages.addressDuringLeaveErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "alternativeEmployeeId") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomDropdownTextFieldWithLabelWidget(
                controller:
                    leaveTextEditingController.alternativeEmployeeController,
                errorMessage:
                    leaveErrorMassages.alternativeEmployeeErrorMassage,
                globalKey: leaveGlobalKey.alternativeEmployeeKey,
                title: S.of(context).alternativeEmployee,
                onTap: () => leaveFunctions
                    .onTapAlternativeEmployee(allFieldsMandatory.isRequired),
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CheckboxWidget(
                isSelected: checkBoxSelection,
                onTap: leaveFunctions.checkboxAction,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "currentBalance") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).currentBalance,
                globalKey: leaveGlobalKey.currentBalanceKey,
                onChange: (value) => leaveFunctions.onChangeCurrentBalance(
                    value, allFieldsMandatory.isRequired),
                controller: leaveTextEditingController.currentBalanceController,
                errorMassage: leaveErrorMassages.currentBalanceErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "yearlyBalance") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).yearlyBalance,
                globalKey: leaveGlobalKey.yearlyBalanceKey,
                onChange: (value) => leaveFunctions.onChangeYearlyBalance(
                    value, allFieldsMandatory.isRequired),
                controller: leaveTextEditingController.yearlyBalanceController,
                errorMassage: leaveErrorMassages.yearlyBalanceErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "remainingBalance") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).remainingBalance,
                globalKey: leaveGlobalKey.remainingBalanceKey,
                onChange: (value) => leaveFunctions.onChangeRemainingBalance(
                    value, allFieldsMandatory.isRequired),
                controller:
                    leaveTextEditingController.remainingBalanceController,
                errorMassage: leaveErrorMassages.remainingBalanceErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "leaveDays") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).leaveDays,
                globalKey: leaveGlobalKey.leaveDaysKey,
                onChange: (value) => leaveFunctions.onChangeLeaveDays(
                    value, allFieldsMandatory.isRequired),
                controller: leaveTextEditingController.leaveDaysController,
                errorMassage: leaveErrorMassages.leaveDaysErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "totalAmount") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).totalAmount,
                globalKey: leaveGlobalKey.totalAmountKey,
                onChange: (value) => leaveFunctions.onChangeTotalAmount(
                    value, allFieldsMandatory.isRequired),
                controller: leaveTextEditingController.totalAmountController,
                errorMassage: leaveErrorMassages.totalAmountErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "leaveReason") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveReasons,
                remarkController:
                    leaveTextEditingController.leaveReasonsController,
                onRemarkChanged: (String value) => leaveFunctions
                    .onChangeLeaveReasons(value, allFieldsMandatory.isRequired),
                text: S.of(context).leaveReasons,
                errorMassage: leaveErrorMassages.leaveReasonsErrorMassage,
                globalKey: leaveGlobalKey.reasonsKey,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "remarks") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveRemarks,
                remarkController: leaveTextEditingController.remarksController,
                onRemarkChanged: (String value) => leaveFunctions
                    .onChangeRemarks(value, allFieldsMandatory.isRequired),
                text: S.of(context).remarks,
                errorMassage: leaveErrorMassages.remarksErrorMassage,
                globalKey: leaveGlobalKey.remarksKey,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == "employeeLeaveAttachments") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => leaveFunctions
                    .showUploadFileBottomSheet(allFieldsMandatory.isRequired),
                deleteFileAction: (String filePath) => leaveFunctions
                    .deleteFileAction(filePath, allFieldsMandatory.isRequired),
                globalKey: leaveGlobalKey.uploadFileKey,
                isMandatory: fileIsMandatory,
                fileErrorMassage: leaveErrorMassages.fileErrorMassage,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
