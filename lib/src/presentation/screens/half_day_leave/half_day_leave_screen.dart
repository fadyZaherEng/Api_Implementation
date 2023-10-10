import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/permission_service_handler.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/half_day_leave/half_day_leave.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/half_day_leave/half_day_leave_bloc.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/utils/half_day_leave_global_key.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/widgets/half_day_leave_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class HalfDayLeaveScreen extends BaseStatefulWidget {
  const HalfDayLeaveScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HalfDayLeaveScreenState();
}

class _HalfDayLeaveScreenState extends BaseState<HalfDayLeaveScreen> {
  bool _isValidLeaveReasons = true;
  bool _isValidLeaveRemarks = true;
  bool _fileIsMandatory = false;
  String _filePath = '';
  String _halfLeaveDate = '';
  String _startTime = '';
  String _endTime = '';
  List<HalfDayLeave> _halfDaysLeave = [];
  List<RequestType> _halfLeaveTypes = [];
  RequestType _halfLeaveType = RequestType(id: 0, name: '');
  final _picker = ImagePicker();

  HalfDayLeaveBloc get _bloc => BlocProvider.of<HalfDayLeaveBloc>(context);
  final HalfDayLeaveErrorMassage _halfDayLeaveErrorMassage =
      HalfDayLeaveErrorMassage();
  final HalfDayLeaveController _halfDayLeaveController = HalfDayLeaveController(
      halfLeaveType: TextEditingController(),
      halfLeaveDate: TextEditingController(),
      startTime: TextEditingController(),
      endTime: TextEditingController(),
      numberOfMinute: TextEditingController(),
      leaveReasons: TextEditingController(),
      remarks: TextEditingController());
  final HalfDayLeaveGlobalKey _halfDayLeaveGlobalKey = HalfDayLeaveGlobalKey(
      halfLeaveType: GlobalKey(),
      halfLeaveDate: GlobalKey(),
      startTime: GlobalKey(),
      endTime: GlobalKey(),
      numberOfMinute: GlobalKey(),
      leaveReasons: GlobalKey(),
      remarks: GlobalKey(),
      file: GlobalKey());

  @override
  void initState() {
    _halfDaysLeave = _bloc.halfDaysLeave;
    _bloc.add(GetHalfDayLeaveTypesEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<HalfDayLeaveBloc, HalfDayLeaveState>(
      listener: (context, state) {
        if (state is HalfDayLeaveLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is HalfDayLeaveBackState) {
          Navigator.pop(context);
        } else if (state is HalfDayLeaveOpenHalfLeaveTypeBottomSheetState) {
          _openHalfLeaveTypeBottomSheet();
        } else if (state is HalfDayLeaveSelectHalfLeaveTypeState) {
          _halfDayLeaveController.halfLeaveType.text = state.halfLeaveType.name;
        } else if (state is HalfDayLeaveOpenUploadFileBottomSheetState) {
          _openUploadFileBottomSheet(state.isMandatory);
        } else if (state is HalfDayLeaveOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is HalfDayLeaveOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is HalfDayLeaveOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is HalfDayLeaveSelectFileState) {
          _filePath = state.filePath;
        } else if (state is HalfDayLeaveDeleteFileState) {
          _filePath = state.filePath;
        } else if (state is HalfDayLeaveHalfLeaveTypeEmptyState) {
          _halfDayLeaveErrorMassage.halfLeaveType = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.halfLeaveType);
        } else if (state is HalfDayLeaveHalfLeaveTypeValidState) {
          _halfDayLeaveErrorMassage.halfLeaveType = null;
        } else if (state is HalfDayLeaveHalfLeaveDateEmptyState) {
          _halfDayLeaveErrorMassage.halfLeaveDate = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.halfLeaveDate);
        } else if (state is HalfDayLeaveHalfLeaveDateValidState) {
          _halfDayLeaveErrorMassage.halfLeaveDate = null;
        } else if (state is HalfDayLeaveStartTimeEmptyState) {
          _halfDayLeaveErrorMassage.startTime = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.startTime);
        } else if (state is HalfDayLeaveStartTimeValidState) {
          _halfDayLeaveErrorMassage.startTime = null;
        } else if (state is HalfDayLeaveEndTimeEmptyState) {
          _halfDayLeaveErrorMassage.endTime = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.endTime);
        } else if (state is HalfDayLeaveEndTimeValidState) {
          _halfDayLeaveErrorMassage.endTime = null;
        } else if (state is HalfDayLeaveNumberOfMinuteEmptyState) {
          _halfDayLeaveErrorMassage.numberOfMinute = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.numberOfMinute);
        } else if (state is HalfDayLeaveNumberOfMinuteValidState) {
          _halfDayLeaveErrorMassage.numberOfMinute = null;
        } else if (state is HalfDayLeaveReasonsEmptyState) {
          _halfDayLeaveErrorMassage.leaveReasons = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.leaveReasons);
          _isValidLeaveReasons = false;
        } else if (state is HalfDayLeaveReasonsValidState) {
          _halfDayLeaveErrorMassage.leaveReasons = null;
          _isValidLeaveReasons = true;
        } else if (state is HalfDayLeaveRemarksEmptyState) {
          _isValidLeaveRemarks = false;
          _halfDayLeaveErrorMassage.remarks = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.remarks);
        } else if (state is HalfDayLeaveRemarksValidState) {
          _halfDayLeaveErrorMassage.remarks = null;
          _isValidLeaveRemarks = true;
        } else if (state is HalfDayLeaveFileEmptyState) {
          _fileIsMandatory = true;
          _halfDayLeaveErrorMassage.file = state.validationMassage;
          _animateTo(_halfDayLeaveGlobalKey.file);
        } else if (state is HalfDayLeaveFileValidState) {
          _halfDayLeaveErrorMassage.file = null;
          _fileIsMandatory = false;
        } else if (state is HalfDayLeaveSubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(HalfDayLeaveBackEvent());
            _bloc.add(HalfDayLeaveBackEvent());
          });
        } else if (state is GetHalfDayLeaveTypesSuccessState) {
          _halfLeaveTypes = state.halfDayTypes;
        } else if (state is GetHalfDayLeaveTypesErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(HalfDayLeaveBackEvent());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).halfDayLeave,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(HalfDayLeaveBackEvent());
          }),
          body: HalfDayLeaveContentWidget(
            halfDaysLeave: _halfDaysLeave,
            filePath: _filePath,
            isValidLeaveReasons: _isValidLeaveReasons,
            isValidLeaveRemarks: _isValidLeaveRemarks,
            fileIsMandatory: _fileIsMandatory,
            halfDayLeaveController: _halfDayLeaveController,
            halfDayLeaveErrorMassage: _halfDayLeaveErrorMassage,
            halfDayLeaveGlobalKey: _halfDayLeaveGlobalKey,
            halfDayLeaveFunctions: HalfDayLeaveFunctions(
              onTapHalfLeaveType: () {
                _bloc.add(HalfDayLeaveOpenHalfLeaveTypeBottomSheetEvent());
              },
              onPickHalfLeaveDate: (String value) {
                _halfLeaveDate = value;
                _bloc.add(
                    HalfDayLeaveValidationHalfLeaveDateEvent(value: value));
              },
              onPickStartTime: (String value) {
                _startTime = value;
                _bloc.add(HalfDayLeaveValidationStartTimeEvent(value: value));
              },
              onPickEndTime: (String value) {
                _endTime = value;
                _bloc.add(HalfDayLeaveValidationEndTimeEvent(value: value));
              },
              onDeleteHalfLeaveDateAction: () {
                _bloc.add(HalfDayLeaveValidationHalfLeaveDateEvent(value: ''));
              },
              onDeleteStartTimeAction: () {
                _bloc.add(HalfDayLeaveValidationStartTimeEvent(value: ''));
              },
              onDeleteEndTimeAction: () {
                _bloc.add(HalfDayLeaveValidationEndTimeEvent(value: ''));
              },
              onChangeNumberOfMinute: (String value) {
                _bloc.add(
                    HalfDayLeaveValidationNumberOfMinuteEvent(value: value));
              },
              onChangeLeaveReasons: (String value, bool isMandatory) {
                _bloc.add(HalfDayLeaveValidationReasonsEvent(
                    value: value, isMandatory: isMandatory));
              },
              onChangeRemarks: (String value, bool isMandatory) {
                _bloc.add(HalfDayLeaveValidationRemarksEvent(
                    value: value, isMandatory: isMandatory));
              },
              showUploadFileBottomSheet: (bool isMandatory) {
                _bloc.add(HalfDayLeaveOpenUploadFileBottomSheetEvent(
                    isMandatory: isMandatory));
              },
              deleteFileAction: (String value, bool isMandatory) {
                _deleteFile(value, isMandatory);
              },
              onTapSubmit: () {
                _bloc.add(HalfDayLeaveSubmitEvent(
                  halfLeaveDate: _halfLeaveDate,
                  startTime: _startTime,
                  endTime: _endTime,
                  file: _filePath,
                  halfDaysLeave: _halfDaysLeave,
                  halfDayLeaveController: _halfDayLeaveController,
                ));
              },
            ),
          ),
        );
      },
    );
  }

  void _openHalfLeaveTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _halfLeaveTypes,
        requestType: _halfLeaveType,
      ),
      titleLabel: S.of(context).type,
    ).then((value) {
      _halfLeaveType = value;
      _bloc.add(HalfDayLeaveSelectHalfLeaveTypeEvent(
        halfLeaveType: value,
      ));
    });
  }

  void _openUploadFileBottomSheet(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(HalfDayLeaveOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () =>
            _bloc.add(HalfDayLeaveOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(HalfDayLeaveOpenFileEvent(isMandatory: isMandatory)),
      ),
      titleLabel: S.of(context).choseFile,
    );
  }

  void _openCamera(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.camera).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(HalfDayLeaveBackEvent());
          _bloc.add(HalfDayLeaveSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(HalfDayLeaveBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(HalfDayLeaveBackEvent());
                  _bloc.add(HalfDayLeaveSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(HalfDayLeaveBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _openGallery(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(HalfDayLeaveBackEvent());
          _bloc.add(HalfDayLeaveSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(HalfDayLeaveBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(HalfDayLeaveBackEvent());
                  _bloc.add(HalfDayLeaveSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(HalfDayLeaveBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _openFile(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.storage,
    )) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        _bloc.add(HalfDayLeaveBackEvent());
        _bloc.add(HalfDayLeaveSelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(HalfDayLeaveBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(HalfDayLeaveBackEvent());
                _bloc.add(HalfDayLeaveSelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(HalfDayLeaveBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveStoragePermission,
      );
    }
  }

  Future _showActionDialog({
    required Function() onPrimaryAction,
    required Function() onSecondaryAction,
    required String primaryText,
    required String secondaryText,
    required String text,
  }) {
    return showActionDialogWidget(
      context: context,
      text: text,
      primaryText: primaryText,
      primaryAction: onPrimaryAction,
      secondaryText: secondaryText,
      secondaryAction: onSecondaryAction,
      icon: ImagePaths.approve,
    );
  }

  void _deleteFile(String value, bool isMandatory) {
    _showActionDialog(
      onPrimaryAction: () {
        _bloc.add(HalfDayLeaveBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(HalfDayLeaveBackEvent());
        _bloc.add(HalfDayLeaveDeleteFileEvent(
            filePath: value, isMandatory: isMandatory));
      },
      primaryText: S.of(context).no,
      secondaryText: S.of(context).yes,
      text: S.of(context).areYouSureYouWantToDeleteThisFile,
    );
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }
}
