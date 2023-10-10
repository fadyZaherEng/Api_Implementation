import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/short_leave/short_leave.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_global_key.dart';
import 'package:talent_link/src/presentation/widgets/custom_numeric_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapShortLeavesToWidgets({
  required BuildContext context,
  required List<AllFieldsMandatory> allFieldsMandatory,
  required ShortLeaveController shortLeaveController,
  required ShortLeaveErrorMassage shortLeaveErrorMassage,
  required ShortLeaveFunctions shortLeaveFunctions,
  required ShortLeaveGlobalKey shortLeaveGlobalKey,
  required bool isValidLeaveReasons,
  required bool isValidRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return allFieldsMandatory.map((allFieldsMandatory) {
    if (allFieldsMandatory.fieldKey == 1) {
      return Visibility(
          visible: allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomTextFieldWithLabelWidget(
                title: S.of(context).referenceName,
                globalKey: shortLeaveGlobalKey.referenceName,
                onChange: (String value) => shortLeaveFunctions
                    .onChangeReferenceName(value, allFieldsMandatory.isRequired),
                controller: shortLeaveController.referenceName,
                errorMassage:shortLeaveErrorMassage.referenceName ,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == 2) {
      return Visibility(
          visible: allFieldsMandatory.isHidden,
          child: Column(
            children: [
              CustomNumericTextFieldWithLabelWidget(
                title: S.of(context).yearlyBalance,
                globalKey: shortLeaveGlobalKey.yearlyBalance,
                onChange: (value) => shortLeaveFunctions.onChangeYearlyBalance(
                    value, allFieldsMandatory.isRequired),
                controller: shortLeaveController.yearlyBalance,
                errorMassage: shortLeaveErrorMassage.yearlyBalance,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey== 3) {
      return Visibility(
          visible: allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveReasons,
                remarkController: shortLeaveController.leaveReasons,
                onRemarkChanged: (String value) => shortLeaveFunctions
                    .onChangeLeaveReasons(value,   allFieldsMandatory.isHidden,),
                text: S.of(context).leaveReasons,
                errorMassage: shortLeaveErrorMassage.leaveReasons,
                globalKey: shortLeaveGlobalKey.leaveReasons,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == 4) {
      return Visibility(
          visible: allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidRemarks,
                remarkController: shortLeaveController.remarks,
                onRemarkChanged: (String value) => shortLeaveFunctions
                    .onChangeRemarks(value, allFieldsMandatory.isRequired),
                text: S.of(context).remarks,
                errorMassage: shortLeaveErrorMassage.remarks,
                globalKey: shortLeaveGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (allFieldsMandatory.fieldKey == 5) {
      return Visibility(
          visible: allFieldsMandatory.isHidden,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => shortLeaveFunctions
                    .showUploadFileBottomSheet(allFieldsMandatory.isRequired),
                deleteFileAction: (String filePath) => shortLeaveFunctions
                    .deleteFileAction(filePath,allFieldsMandatory.isRequired),
                globalKey: shortLeaveGlobalKey.uploadFile,
                isMandatory: fileIsMandatory,
                fileErrorMassage: shortLeaveErrorMassage.file,
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
