import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/resume_duty/resume_duty.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_error_msssage.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_functions.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_global_key.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapResumeDutyToWidgets({
  required List<ResumeDuty> resumeDuties,
  required BuildContext context,
  required ResumeDutyGlobalKey resumeDutyGlobalKey,
  required ResumeDutyErrorMassage resumeDutyErrorMassage,
  required ResumeDutyFunctions resumeDutyFunctions,
  required ResumeDutyController resumeDutyController,
  required bool isValidLeaveRemarks,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return resumeDuties.map((resumeDuty) {
    if (resumeDuty.id == 1) {
      return Visibility(
          visible: resumeDuty.isVisible,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveRemarks,
                remarkController: resumeDutyController.remarks,
                onRemarkChanged: (String value) => resumeDutyFunctions
                    .onChangeRemarks(value, resumeDuty.isMandatory),
                text: S.of(context).remarks,
                errorMassage: resumeDutyErrorMassage.remarks,
                globalKey: resumeDutyGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    }
    if (resumeDuty.id == 2) {
      return Visibility(
          visible: resumeDuty.isVisible,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => resumeDutyFunctions
                    .showUploadFileBottomSheet(resumeDuty.isMandatory),
                deleteFileAction: (String filePath) => resumeDutyFunctions
                    .deleteFileAction(filePath, resumeDuty.isMandatory),
                globalKey: resumeDutyGlobalKey.file,
                isMandatory: fileIsMandatory,
                fileErrorMassage: resumeDutyErrorMassage.file,
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
