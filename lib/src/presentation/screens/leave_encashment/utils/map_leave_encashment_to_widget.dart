import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_global_key.dart';
import 'package:talent_link/src/presentation/widgets/check_box_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapLeavesEncashmentToWidgets({
  required List<AllFieldsMandatory> allFieldsMandatory,
  required BuildContext context,
  required LeaveEncashmentGlobalKey leaveEncashmentGlobalKey,
  required LeaveEncashmentErrorMassage leaveEncashmentErrorMassage,
  required LeaveEncashmentFunctions leaveEncashmentFunctions,
  required LeaveEncashmentController leaveEncashmentController,
  required bool checkBoxSelection,
  required bool isValidRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return allFieldsMandatory.map((leaveEncashment) {
    if (leaveEncashment.fieldKey == "") {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              CheckboxWidget(
                isSelected: checkBoxSelection,
                onTap: leaveEncashmentFunctions.checkboxAction,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (leaveEncashment.fieldKey == 'CurrentBalance') {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).currentBalance,
                globalKey: leaveEncashmentGlobalKey.currentBalance,
                onChange: (value) => leaveEncashmentFunctions
                    .onChangeCurrentBalance(value, leaveEncashment.isRequired),
                controller: leaveEncashmentController.currentBalance,
                errorMassage: leaveEncashmentErrorMassage.currentBalance,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (leaveEncashment.fieldKey == "YearlyBalance") {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).yearlyBalance,
                globalKey: leaveEncashmentGlobalKey.yearlyBalance,
                onChange: (value) => leaveEncashmentFunctions
                    .onChangeYearlyBalance(value, leaveEncashment.isRequired),
                controller: leaveEncashmentController.yearlyBalance,
                errorMassage: leaveEncashmentErrorMassage.yearlyBalance,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (leaveEncashment.fieldKey == "RemainingBalance") {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).remainingBalance,
                globalKey: leaveEncashmentGlobalKey.remainingBalance,
                onChange: (value) =>
                    leaveEncashmentFunctions.onChangeRemainingBalance(
                        value, leaveEncashment.isRequired),
                controller: leaveEncashmentController.remainingBalance,
                errorMassage: leaveEncashmentErrorMassage.remainingBalance,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (leaveEncashment.fieldKey == "TotalAmount") {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).totalAmount,
                globalKey: leaveEncashmentGlobalKey.totalAmount,
                onChange: (value) => leaveEncashmentFunctions
                    .onChangeTotalAmount(value, leaveEncashment.isRequired),
                controller: leaveEncashmentController.totalAmount,
                errorMassage: leaveEncashmentErrorMassage.totalAmount,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (leaveEncashment.fieldKey == "remarks") {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidRemarks,
                remarkController: leaveEncashmentController.remarks,
                onRemarkChanged: (String value) => leaveEncashmentFunctions
                    .onChangeRemarks(value, leaveEncashment.isRequired),
                text: S.of(context).remarks,
                errorMassage: leaveEncashmentErrorMassage.remarks,
                globalKey: leaveEncashmentGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (leaveEncashment.fieldKey ==
        'employeeLeaveEncashmentAttachments') {
      return Visibility(
          visible: !leaveEncashment.isHidden,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => leaveEncashmentFunctions
                    .showUploadFileBottomSheet(leaveEncashment.isRequired),
                deleteFileAction: (String filePath) => leaveEncashmentFunctions
                    .deleteFileAction(filePath, leaveEncashment.isRequired),
                globalKey: leaveEncashmentGlobalKey.uploadFile,
                isMandatory: fileIsMandatory,
                fileErrorMassage: leaveEncashmentErrorMassage.file,
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
