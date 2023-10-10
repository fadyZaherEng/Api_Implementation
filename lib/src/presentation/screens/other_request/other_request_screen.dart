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
import 'package:talent_link/src/domain/entities/other_rquest/other_rquest.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/other_request/other_request_bloc.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_controller.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_error_massage.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_functions.dart';
import 'package:talent_link/src/presentation/screens/other_request/utils/other_request_global_key.dart';
import 'package:talent_link/src/presentation/screens/other_request/widgets/other_request_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class OtherRequestScreen extends BaseStatefulWidget {
  const OtherRequestScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _OtherRequestScreenState();
}

class _OtherRequestScreenState extends BaseState<OtherRequestScreen> {
  OtherRequestBloc get _bloc => BlocProvider.of<OtherRequestBloc>(context);
  bool _isValidRemarks = true;
  bool _isValidNotes = true;
  bool _fileIsMandatory = false;
  String _filePath = '';
  final _picker = ImagePicker();
  String _requestedDate = '';
  List<OtherRequest> _otherRequests = [];
  RequestType _requestType = RequestType(id: 0, name: "", isSelected: false);
  List<RequestType> _otherRequestTypes = [];
  final OtherRequestGlobalKey _otherRequestGlobalKey = OtherRequestGlobalKey(
      request: GlobalKey(),
      requestedDate: GlobalKey(),
      remarks: GlobalKey(),
      notes: GlobalKey(),
      file: GlobalKey());
  final OtherRequestController _otherRequestController = OtherRequestController(
      request: TextEditingController(),
      requestedDate: TextEditingController(),
      remarks: TextEditingController(),
      notes: TextEditingController());

  final OtherRequestErrorMassage _otherRequestErrorMassage =
      OtherRequestErrorMassage();

  @override
  void initState() {
    _otherRequests = _bloc.otherRequests;
    _bloc.add(GetOtherRequestTypesEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<OtherRequestBloc, OtherRequestState>(
      listener: (context, state) {
        if (state is OtherRequestLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is OtherRequestBackState) {
          Navigator.pop(context);
        } else if (state is OtherRequestOpenRequestBottomSheetState) {
          _openRequestBottomSheet();
        } else if (state is OtherRequestSelectRequestState) {
          _otherRequestController.request.text = state.requestType.name;
        } else if (state is OtherRequestOpenUploadFileBottomSheetState) {
          _openUploadFileBottomSheet(state.isMandatory);
        } else if (state is OtherRequestOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is OtherRequestOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is OtherRequestOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is OtherRequestSelectFileState) {
          _filePath = state.filePath;
        } else if (state is OtherRequestDeleteFileState) {
          _filePath = state.filePath;
        } else if (state is OtherRequestValidationRequestEmptyState) {
          _otherRequestErrorMassage.request = state.validationMassage;
          _animateTo(_otherRequestGlobalKey.request);
        } else if (state is OtherRequestValidationRequestValidState) {
          _otherRequestErrorMassage.request = null;
        } else if (state is OtherRequestValidationRequestDateEmptyState) {
          _otherRequestErrorMassage.requestedDate = state.validationMassage;
          _animateTo(_otherRequestGlobalKey.requestedDate);
        } else if (state is OtherRequestValidationRequestDateValidState) {
          _otherRequestErrorMassage.requestedDate = null;
        } else if (state is OtherRequestValidationRemarksEmptyState) {
          _otherRequestErrorMassage.remarks = state.validationMassage;
          _isValidRemarks = false;
          _animateTo(_otherRequestGlobalKey.remarks);
        } else if (state is OtherRequestValidationRemarksValidState) {
          _otherRequestErrorMassage.remarks = null;
          _isValidRemarks = true;
        } else if (state is OtherRequestValidationNotesEmptyState) {
          _otherRequestErrorMassage.notes = state.validationMassage;
          _animateTo(_otherRequestGlobalKey.notes);
          _isValidNotes = false;
        } else if (state is OtherRequestValidationNotesValidState) {
          _otherRequestErrorMassage.notes = null;
          _isValidNotes = true;
        } else if (state is OtherRequestValidationFileEmptyState) {
          _otherRequestErrorMassage.file = state.validationMassage;
          _animateTo(_otherRequestGlobalKey.file);
          _fileIsMandatory = true;
        } else if (state is OtherRequestValidationFileValidState) {
          _otherRequestErrorMassage.file = null;
          _fileIsMandatory = false;
        } else if (state is OtherRequestSubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(OtherRequestBackEvent());
            _bloc.add(OtherRequestBackEvent());
          });
        } else if (state is GetOtherRequestTypesSuccessState) {
          _otherRequestTypes = state.otherRequestTypes;
        } else if (state is GetOtherRequestTypesErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(OtherRequestBackEvent());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: buildAppBarWidget(
              context,
              title: S.of(context).otherRequest,
              isHaveBackButton: true,
              onBackButtonPressed: () {
                _bloc.add(OtherRequestBackEvent());
              },
            ),
            body: OtherRequestContentWidget(
              otherRequests: _otherRequests,
              isValidRemarks: _isValidRemarks,
              isValidNotes: _isValidNotes,
              fileIsMandatory: _fileIsMandatory,
              filePath: _filePath,
              otherRequestGlobalKey: _otherRequestGlobalKey,
              otherRequestController: _otherRequestController,
              otherRequestErrorMassage: _otherRequestErrorMassage,
              otherRequestFunctions: OtherRequestFunctions(
                onTapRequest: () {
                  _bloc.add(OtherRequestOpenRequestBottomSheetEvent());
                },
                onPickRequestedDate: (String value) {
                  _requestedDate = value;
                  _bloc.add(
                      OtherRequestValidationRequestDateEvent(value: value));
                },
                onDeleteRequestedDate: () {
                  _bloc.add(OtherRequestValidationRequestDateEvent(value: ''));
                },
                onChangeRemarks: (String value, bool isMandatory) {
                  _bloc.add(OtherRequestValidationRemarkEvent(
                      value: value, isMandatory: isMandatory));
                },
                onChangeNotes: (String value, bool isMandatory) {
                  _bloc.add(OtherRequestValidationNotesEvent(
                      value: value, isMandatory: isMandatory));
                },
                showUploadFileBottomSheet: (bool isMandatory) {
                  _bloc.add(OtherRequestOpenUploadFileBottomSheetEvent(
                      isMandatory: isMandatory));
                },
                deleteFileAction: (String value, bool isMandatory) {
                  _deleteFile(value, isMandatory);
                },
                onTapSubmit: () {
                  _bloc.add(OtherRequestSubmitEvent(
                      requestedDate: _requestedDate,
                      otherRequestController: _otherRequestController,
                      file: _filePath,
                      otherRequests: _otherRequests));
                },
              ),
            ));
      },
    );
  }

  void _openRequestBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _otherRequestTypes,
        requestType: _requestType,
      ),
      titleLabel: S.of(context).request,
    ).then((value) {
      _requestType = value;
      _bloc.add(OtherRequestSelectRequestEvent(
        requestType: value,
      ));
    });
  }

  void _openUploadFileBottomSheet(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(OtherRequestOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () =>
            _bloc.add(OtherRequestOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(OtherRequestOpenFileEvent(isMandatory: isMandatory)),
      ),
      titleLabel: S.of(context).choseFile,
    );
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

  void _openCamera(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.camera).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(OtherRequestBackEvent());
          _bloc.add(OtherRequestSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(OtherRequestBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(OtherRequestBackEvent());
                  _bloc.add(OtherRequestSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(OtherRequestBackEvent());
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
          _bloc.add(OtherRequestBackEvent());
          _bloc.add(OtherRequestSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(OtherRequestBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(OtherRequestBackEvent());
                  _bloc.add(OtherRequestSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(OtherRequestBackEvent());
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
        _bloc.add(OtherRequestBackEvent());
        _bloc.add(OtherRequestSelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(OtherRequestBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(OtherRequestBackEvent());
                _bloc.add(OtherRequestSelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(OtherRequestBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveStoragePermission,
      );
    }
  }

  void _deleteFile(String value, bool isMandatory) {
    _showActionDialog(
      onPrimaryAction: () {
        _bloc.add(OtherRequestBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(OtherRequestBackEvent());
        _bloc.add(OtherRequestDeleteFileEvent(
            filePath: value, isMandatory: isMandatory));
      },
      primaryText: S.of(context).no,
      secondaryText: S.of(context).yes,
      text: S.of(context).areYouSureYouWantToDeleteThisFile,
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

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }
}
