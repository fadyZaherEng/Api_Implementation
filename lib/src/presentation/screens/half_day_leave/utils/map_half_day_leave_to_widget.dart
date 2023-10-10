import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/half_day_leave/half_day_leave.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_global_key.dart';
import 'package:talent_link/src/presentation/widgets/remark_text_field_widget.dart';
import 'package:talent_link/src/presentation/widgets/upload_file_widget.dart';

List<Widget> mapHalfDayLeaveToWidgets({
  required List<HalfDayLeave> halfDaysLeave,
  required BuildContext context,
  required HalfDayLeaveGlobalKey halfDayLeaveGlobalKey,
  required HalfDayLeaveErrorMassage halfDayLeaveErrorMassage,
  required HalfDayLeaveFunctions halfDayLeaveFunctions,
  required HalfDayLeaveController halfDayLeaveController,
  required bool isValidLeaveRemarks,
  required bool isValidLeaveReasons,
  required bool fileIsMandatory,
  required String filePath,
}) {
  return halfDaysLeave.map((halfDayLeave) {
    if (halfDayLeave.id == 1) {
      return Visibility(
          visible: halfDayLeave.isVisible,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveReasons,
                remarkController: halfDayLeaveController.leaveReasons,
                onRemarkChanged: (String value) => halfDayLeaveFunctions
                    .onChangeLeaveReasons(value, halfDayLeave.isMandatory),
                text: S.of(context).leaveReasons,
                errorMassage: halfDayLeaveErrorMassage.leaveReasons,
                globalKey: halfDayLeaveGlobalKey.leaveReasons,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (halfDayLeave.id == 2) {
      return Visibility(
          visible: halfDayLeave.isVisible,
          child: Column(
            children: [
              RemarkTextFieldWidget(
                isRemarkValid: isValidLeaveRemarks,
                remarkController: halfDayLeaveController.remarks,
                onRemarkChanged: (String value) => halfDayLeaveFunctions
                    .onChangeRemarks(value, halfDayLeave.isMandatory),
                text: S.of(context).remarks,
                errorMassage: halfDayLeaveErrorMassage.remarks,
                globalKey: halfDayLeaveGlobalKey.remarks,
              ),
              const SizedBox(height: 20),
            ],
          ));
    } else if (halfDayLeave.id == 3) {
      return Visibility(
          visible: halfDayLeave.isVisible,
          child: Column(
            children: [
              UploadFileWidget(
                filePath: filePath,
                showUploadFileBottomSheet: () => halfDayLeaveFunctions
                    .showUploadFileBottomSheet(halfDayLeave.isMandatory),
                deleteFileAction: (String filePath) => halfDayLeaveFunctions
                    .deleteFileAction(filePath, halfDayLeave.isMandatory),
                globalKey: halfDayLeaveGlobalKey.file,
                isMandatory: fileIsMandatory,
                fileErrorMassage: halfDayLeaveErrorMassage.file,
              ),
            ],
          ));
    } else {
      return const SizedBox.shrink();
    }
  }).toList();
}
