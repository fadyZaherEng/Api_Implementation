import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_controller.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_error_massage.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_functions.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_global_key.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapLoansToWidgets({
  required List<AllFieldsMandatory> allFieldsMandatory,
  required BuildContext context,
  required LoansGlobalKey loansGlobalKey,
  required LoansErrorMassage loansErrorMassage,
  required LoansFunctions loansFunctions,
  required LoansController loansController,
  required bool isValidLeaveRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return allFieldsMandatory.map((allFieldsMandatory) {
    if (allFieldsMandatory.fieldKey == "remarks") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveRemarks,
                remarkController: loansController.remarks,
                onRemarkChanged: (String value) =>
                    loansFunctions.onChangeRemarks(value, allFieldsMandatory.isRequired),
                text: S.of(context).remarks,
                errorMassage: loansErrorMassage.remarks,
                globalKey: loansGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    }
    if (allFieldsMandatory.fieldKey == "employeeLoanAttachments") {
      return Visibility(
          visible: !allFieldsMandatory.isHidden,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () =>
                    loansFunctions.showUploadFileBottomSheet(allFieldsMandatory.isRequired),
                deleteFileAction: (String filePath) => loansFunctions
                    .deleteFileAction(filePath, allFieldsMandatory.isRequired),
                globalKey: loansGlobalKey.file,
                isMandatory: fileIsMandatory,
                fileErrorMassage: loansErrorMassage.file,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else {
      return const SizedBox();
    }
  }).toList();
}
