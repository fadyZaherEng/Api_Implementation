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
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/resume_duty/resume_duty.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty/resume_duty_bloc.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_controller.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_error_msssage.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_functions.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/utils/resume_duty_global_key.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/widgets/resume_duty_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class ResumeDutyScreen extends BaseStatefulWidget {
  const ResumeDutyScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ResumeDutyScreenState();
}

class _ResumeDutyScreenState extends BaseState<ResumeDutyScreen> {
  ResumeDutyBloc get _bloc => BlocProvider.of<ResumeDutyBloc>(context);
  String _filePath = '';
  String _actualResumeDutyData = '';
  bool _isValidLeaveRemarks = true;
  bool _fileIsMandatory = false;
  final _picker = ImagePicker();
  bool _isVisiblePaymentMethod = false;
  int _isByPayroll = 0;
  List<ResumeDuty> _resumeDuties = [];
  List<RequestType> _referenceTypes = [];
  List<RequestType> _referencesData = [];
  List<RequestPaymentMethod> _paymentMethods = [];
  RequestType _referenceType = RequestType(id: 0, name: '');
  RequestType _referenceData = RequestType(id: 0, name: '');
  RequestPaymentMethod _paymentMethod = RequestPaymentMethod(id: 0, name: '');

  final ResumeDutyErrorMassage _resumeDutyErrorMassage =
      ResumeDutyErrorMassage();
  final ResumeDutyController _resumeDutyController = ResumeDutyController(
      referenceType: TextEditingController(),
      referenceData: TextEditingController(),
      paymentMethod: TextEditingController(),
      actualResumeDutyDate: TextEditingController(),
      remarks: TextEditingController());
  final ResumeDutyGlobalKey _resumeDutyGlobalKey = ResumeDutyGlobalKey(
      referenceType: GlobalKey(),
      referenceData: GlobalKey(),
      paymentMethod: GlobalKey(),
      actualResumeDutyDate: GlobalKey(),
      remarks: GlobalKey(),
      file: GlobalKey());

  @override
  void initState() {
    _bloc.add(GetResumeDutyReferenceTypesEvent());
    _bloc.add(GetResumeDutyPaymentMethodEvent());
    _resumeDuties = _bloc.resumeDuties;
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ResumeDutyBloc, ResumeDutyState>(
      listener: (context, state) {
        if (state is ResumeDutyLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is ResumeDutyBackState) {
          Navigator.pop(context);
        } else if (state is ResumeDutyOpenReferenceTypeBottomSheetState) {
          _openReferenceTypeBottomSheet();
        } else if (state is ResumeDutySelectReferenceTypeState) {
          _resumeDutyController.referenceType.text = state.requestType.name;
        } else if (state is ResumeDutyOpenReferenceDataBottomSheetState) {
          _openReferenceDataBottomSheet();
        } else if (state is ResumeDutySelectReferenceDataState) {
          _resumeDutyController.referenceData.text = state.requestType.name;
        } else if (state is ResumeDutyOpenPaymentMethodBottomSheetState) {
          _openPaymentMethodBottomSheet();
        } else if (state is ResumeDutySelectPaymentMethodState) {
          _resumeDutyController.paymentMethod.text = state.requestType.name;
        } else if (state is ResumeDutyOpenUploadFileBottomSheetState) {
          _openUploadFileBottomSheet(state.isMandatory);
        } else if (state is ResumeDutyOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is ResumeDutyOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is ResumeDutyOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is ResumeDutySelectFileState) {
          _filePath = state.filePath;
        } else if (state is ResumeDutyDeleteFileState) {
          _filePath = state.filePath;
        } else if (state is ResumeDutyValidationReferenceTypeEmptyState) {
          _resumeDutyErrorMassage.referenceType = state.validationMassage;
          _animateTo(_resumeDutyGlobalKey.referenceType);
        } else if (state is ResumeDutyValidationReferenceTypeValidState) {
          _resumeDutyErrorMassage.referenceType = null;
        } else if (state is ResumeDutyValidationReferenceDataEmptyState) {
          _resumeDutyErrorMassage.referenceData = state.validationMassage;
          _animateTo(_resumeDutyGlobalKey.referenceData);
        } else if (state is ResumeDutyValidationReferenceDataValidState) {
          _resumeDutyErrorMassage.referenceData = null;
        } else if (state is ResumeDutyValidationPaymentMethodEmptyState) {
          _resumeDutyErrorMassage.paymentMethod = state.validationMassage;
          _animateTo(_resumeDutyGlobalKey.paymentMethod);
        } else if (state is ResumeDutyValidationPaymentMethodValidState) {
          _resumeDutyErrorMassage.paymentMethod = null;
        } else if (state
            is ResumeDutyValidationActualResumeDutyDateEmptyState) {
          _resumeDutyErrorMassage.actualResumeDutyDate =
              state.validationMassage;
          _animateTo(_resumeDutyGlobalKey.actualResumeDutyDate);
        } else if (state
            is ResumeDutyValidationActualResumeDutyDateValidState) {
          _resumeDutyErrorMassage.actualResumeDutyDate = null;
        } else if (state is ResumeDutyValidationRemarksEmptyState) {
          _isValidLeaveRemarks = false;
          _resumeDutyErrorMassage.remarks = state.validationMassage;
          _animateTo(_resumeDutyGlobalKey.remarks);
        } else if (state is ResumeDutyValidationRemarksValidState) {
          _isValidLeaveRemarks = true;
          _resumeDutyErrorMassage.remarks = null;
        } else if (state is ResumeDutyValidationFileEmptyState) {
          _fileIsMandatory = true;
          _resumeDutyErrorMassage.file = state.validationMassage;
          _animateTo(_resumeDutyGlobalKey.file);
        } else if (state is ResumeDutyValidationFileValidState) {
          _fileIsMandatory = false;
          _resumeDutyErrorMassage.file = null;
        } else if (state is ResumeDutySubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(ResumeDutyBackEvent());
            _bloc.add(ResumeDutyBackEvent());
          });
        } else if (state is GetResumeDutyReferenceTypesSuccessState) {
          _referenceTypes = state.requestTypes;
          _resumeDutyController.referenceData.text = '';
          _resumeDutyErrorMassage.referenceData = null;
        } else if (state is GetResumeDutyReferenceTypesErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ResumeDutyBackEvent());
          });
        } else if (state is GetResumeDutyPaymentMethodSuccessState) {
          _paymentMethods = state.paymentMethods;
        } else if (state is GetResumeDutyPaymentMethodsErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ResumeDutyBackEvent());
          });
        } else if (state is GetResumeDutyReferenceDataSuccessState) {
          _referencesData = state.requestTypes;
        } else if (state is GetResumeDutyReferenceDataErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ResumeDutyBackEvent());
          });
        } else if (state is ResumeDutyShowPaymentMethodTextFieldState) {
          _isVisiblePaymentMethod = state.isVisiblePaymentMethod;
          if (state.isVisiblePaymentMethod == false) {
            _paymentMethod = RequestPaymentMethod(id: 0, name: '');
            _resumeDutyController.paymentMethod.text = '';
            _resumeDutyErrorMassage.paymentMethod = null;
          }
          _bloc.add(GetResumeDutyReferenceDataEvent(
              isByPayroll: _isByPayroll,
              resumeDutyReferenceType: _referenceType.id));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).resumeDuty,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(ResumeDutyBackEvent());
          }),
          body: ResumeDutyContentWidget(
            resumeDuties: _resumeDuties,
            filePath: _filePath,
            isValidLeaveRemarks: _isValidLeaveRemarks,
            fileIsMandatory: _fileIsMandatory,
            resumeDutyErrorMassage: _resumeDutyErrorMassage,
            resumeDutyController: _resumeDutyController,
            resumeDutyGlobalKey: _resumeDutyGlobalKey,
            resumeDutyFunctions: ResumeDutyFunctions(onTapReferenceType: () {
              _bloc.add(ResumeDutyOpenReferenceTypeBottomSheetEvent());
            }, onTapReferenceData: () {
              _bloc.add(ResumeDutyOpenReferenceDataBottomSheetEvent());
            }, onSelectRadioButton: (SingleSelectionModel selectionModel) {
              _isByPayroll = selectionModel.id;
              _bloc.add(ResumeDutyShowPaymentMethodTextFieldEvent(
                  selectionModel: selectionModel));
            }, onTapPaymentMethod: () {
              _bloc.add(ResumeDutyOpenPaymentMethodBottomSheetEvent());
            }, onPickActualResumeDutyDate: (String value) {
              _actualResumeDutyData = value;
              _bloc.add(
                  ResumeDutyValidationActualResumeDutyDateEvent(value: value));
            }, onDeleteActualResumeDutyDateAction: () {
              _bloc.add(
                  ResumeDutyValidationActualResumeDutyDateEvent(value: ''));
            }, onChangeRemarks: (String value, bool isMandatory) {
              _bloc.add(ResumeDutyValidationRemarksEvent(
                  value: value, isMandatory: isMandatory));
            }, showUploadFileBottomSheet: (bool isMandatory) {
              _bloc.add(ResumeDutyOpenUploadFileBottomSheetEvent(
                  isMandatory: isMandatory));
            }, deleteFileAction: (String value, bool isMandatory) {
              _deleteFile(value, isMandatory);
            }, onTapSubmit: () {
              _bloc.add(ResumeDutySubmitEvent(
                  actualResumeDutyData: _actualResumeDutyData,
                  resumeDutyController: _resumeDutyController,
                  resumeDuties: _resumeDuties,
                  file: _filePath,
                  isVisiblePaymentMethod: _isVisiblePaymentMethod));
            }),
            isVisiblePaymentMethod: _isVisiblePaymentMethod,
          ),
        );
      },
    );
  }

  void _openReferenceTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _referenceTypes,
        requestType: _referenceType,
      ),
      titleLabel: S.of(context).referenceType,
    ).then((value) {
      _referenceType = value;
      _bloc.add(ResumeDutySelectReferenceTypeEvent(
        requestType: value,
      ));
    });
  }

  void _openReferenceDataBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _referencesData,
        requestType: _referenceData,
      ),
      titleLabel: S.of(context).referenceData,
    ).then((value) {
      _referenceData = value;
      _bloc.add(ResumeDutySelectReferenceDataEvent(
        requestType: value,
      ));
    });
  }

  void _openPaymentMethodBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _paymentMethods,
        paymentMethod: _paymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _paymentMethod = value;
      _bloc.add(ResumeDutySelectPaymentMethodEvent(
        requestType: value,
        isVisiblePaymentMethod: _isVisiblePaymentMethod,
      ));
    });
  }

  void _openUploadFileBottomSheet(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(ResumeDutyOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () =>
            _bloc.add(ResumeDutyOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(ResumeDutyOpenFileEvent(isMandatory: isMandatory)),
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
          _bloc.add(ResumeDutyBackEvent());
          _bloc.add(ResumeDutySelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(ResumeDutyBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(ResumeDutyBackEvent());
                  _bloc.add(ResumeDutySelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(ResumeDutyBackEvent());
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
          _bloc.add(ResumeDutyBackEvent());
          _bloc.add(ResumeDutySelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(ResumeDutyBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(ResumeDutyBackEvent());
                  _bloc.add(ResumeDutySelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(ResumeDutyBackEvent());
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
        _bloc.add(ResumeDutyBackEvent());
        _bloc.add(ResumeDutySelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(ResumeDutyBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(ResumeDutyBackEvent());
                _bloc.add(ResumeDutySelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(ResumeDutyBackEvent());
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
        _bloc.add(ResumeDutyBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(ResumeDutyBackEvent());
        _bloc.add(ResumeDutyDeleteFileEvent(
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
