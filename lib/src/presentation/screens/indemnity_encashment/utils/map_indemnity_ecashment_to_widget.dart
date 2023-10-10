import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/indemnity_encashment/indemnity_encashment.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_global_key.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapIndemnityEncashmentToWidgets({
  required List<IndemnityEncashment> indemnitiesEncashment,
  required BuildContext context,
  required IndemnityEncashmentGlobalKey indemnityEncashmentGlobalKey,
  required IndemnityEncashmentErrorMassage indemnityEncashmentErrorMassage,
  required IndemnityEncashmentFunctions indemnityEncashmentFunctions,
  required IndemnityEncashmentController indemnityEncashmentController,
  required bool isValidLeaveRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return indemnitiesEncashment.map((indemnityEncashment) {
    if (indemnityEncashment.id == 1) {
      return Visibility(
          visible: indemnityEncashment.isVisible,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveRemarks,
                remarkController: indemnityEncashmentController.remarks,
                onRemarkChanged: (String value) => indemnityEncashmentFunctions
                    .onChangeRemarks(value, indemnityEncashment.isMandatory),
                text: S.of(context).remarks,
                errorMassage: indemnityEncashmentErrorMassage.remarks,
                globalKey: indemnityEncashmentGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    }
    if (indemnityEncashment.id == 2) {
      return Visibility(
          visible: indemnityEncashment.isVisible,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => indemnityEncashmentFunctions
                    .showUploadFileBottomSheet(indemnityEncashment.isMandatory),
                deleteFileAction: (String filePath) =>
                    indemnityEncashmentFunctions.deleteFileAction(
                        filePath, indemnityEncashment.isMandatory),
                globalKey: indemnityEncashmentGlobalKey.file,
                isMandatory: fileIsMandatory,
                fileErrorMassage: indemnityEncashmentErrorMassage.file,
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
