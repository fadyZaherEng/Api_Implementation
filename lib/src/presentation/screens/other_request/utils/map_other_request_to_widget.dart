import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/other_rquest/other_rquest.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_controller.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_error_massage.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_functions.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_global_key.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapOtherRequestToWidgets({
  required List<OtherRequest> otherRequests,
  required BuildContext context,
  required OtherRequestGlobalKey otherRequestGlobalKey,
  required OtherRequestErrorMassage otherRequestErrorMassage,
  required OtherRequestFunctions otherRequestFunctions,
  required OtherRequestController otherRequestController,
  required bool isValidRemarks,
  required bool isValidNotes,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return otherRequests.map((otherRequest) {
    if (otherRequest.id == 1) {
      return Visibility(
          visible: otherRequest.isVisible,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidRemarks,
                remarkController: otherRequestController.remarks,
                onRemarkChanged: (String value) => otherRequestFunctions
                    .onChangeRemarks(value, otherRequest.isMandatory),
                text: S.of(context).remarks,
                errorMassage: otherRequestErrorMassage.remarks,
                globalKey: otherRequestGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (otherRequest.id == 2) {
      return Visibility(
          visible: otherRequest.isVisible,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidNotes,
                remarkController: otherRequestController.notes,
                onRemarkChanged: (String value) => otherRequestFunctions
                    .onChangeNotes(value, otherRequest.isMandatory),
                text: S.of(context).notes,
                errorMassage: otherRequestErrorMassage.notes,
                globalKey: otherRequestGlobalKey.notes,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (otherRequest.id == 3) {
      return Visibility(
          visible: otherRequest.isVisible,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => otherRequestFunctions
                    .showUploadFileBottomSheet(otherRequest.isMandatory),
                deleteFileAction: (String filePath) => otherRequestFunctions
                    .deleteFileAction(filePath, otherRequest.isMandatory),
                globalKey: otherRequestGlobalKey.file,
                isMandatory: fileIsMandatory,
                fileErrorMassage: otherRequestErrorMassage.file,
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
