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
import 'package:talent_link/src/domain/entities/indemnity_encashment/indemnity_encashment.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment/indemnity_encashment_bloc.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/utils/indemnity_encashment_global_key.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/widgets/indemnity_encashment_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';

class IndemnityEncashmentScreen extends BaseStatefulWidget {
  const IndemnityEncashmentScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _IndemnityEncashmentScreenState();
}

class _IndemnityEncashmentScreenState
    extends BaseState<IndemnityEncashmentScreen> {
  bool _isValidRemarks = true;
  bool _fileIsMandatory = false;
  String _filePath = '';
  String _paymentMonth = '';
  String _requestedDate = '';
  final _picker = ImagePicker();
  List<IndemnityEncashment> _indemnitiesEncashment = [];
  List<RequestPaymentMethod> _indemnityEncashmentPaymentMethods = [];
  RequestPaymentMethod _indemnityEncashmentPaymentMethod =
      RequestPaymentMethod(id: 0, name: '');

  IndemnityEncashmentBloc get _bloc =>
      BlocProvider.of<IndemnityEncashmentBloc>(context);
  final IndemnityEncashmentErrorMassage _indemnityEncashmentErrorMassage =
      IndemnityEncashmentErrorMassage();
  final IndemnityEncashmentController _indemnityEncashmentController =
      IndemnityEncashmentController(
    requestedDate: TextEditingController(),
    requestedDays: TextEditingController(),
    paymentMonth: TextEditingController(),
    paymentMethod: TextEditingController(),
    remarks: TextEditingController(),
  );

  final IndemnityEncashmentGlobalKey _indemnityEncashmentGlobalKey =
      IndemnityEncashmentGlobalKey(
    file: GlobalKey(),
    remarks: GlobalKey(),
    paymentMethod: GlobalKey(),
    requestedDate: GlobalKey(),
    requestedDays: GlobalKey(),
    paymentMonth: GlobalKey(),
  );

  @override
  void initState() {
    _indemnitiesEncashment = _bloc.indemnitiesEncashment;
    _bloc.add(IndemnityEncashmentGetPaymentMethodEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<IndemnityEncashmentBloc, IndemnityEncashmentState>(
      listener: (context, state) {
        if (state is IndemnityEncashmentLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is IndemnityEncashmentBackState) {
          Navigator.pop(context);
        } else if (state
            is IndemnityEncashmentOpenPaymentMethodBottomSheetState) {
          _onIndemnityEncashmentOpenPaymentMethodBottomSheetState();
        } else if (state is IndemnityEncashmentSelectPaymentMethodState) {
          _indemnityEncashmentController.paymentMethod.text = state.value.name;
          _bloc.add(IndemnityEncashmentValidationPaymentMethodEvent(
              value: state.value.name));
        } else if (state is IndemnityEncashmentOpenUploadFileState) {
          _onIndemnityEncashmentOpenUploadFileState(state.isMandatory);
        } else if (state is IndemnityEncashmentOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is IndemnityEncashmentOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is IndemnityEncashmentOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is IndemnityEncashmentSelectFileState) {
          _filePath = state.value;
        } else if (state is IndemnityEncashmentDeleteFileState) {
          _filePath = state.value;
        } else if (state
            is IndemnityEncashmentValidationRequestedDateEmptyState) {
          _indemnityEncashmentErrorMassage.requestedDate =
              state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.requestedDate);
        } else if (state
            is IndemnityEncashmentValidationRequestedDateValidState) {
          _indemnityEncashmentErrorMassage.requestedDate = null;
        } else if (state
            is IndemnityEncashmentValidationRequestedDaysEmptyState) {
          _indemnityEncashmentErrorMassage.requestedDays =
              state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.requestedDays);
        } else if (state
            is IndemnityEncashmentValidationRequestedDaysValidState) {
          _indemnityEncashmentErrorMassage.requestedDays = null;
        } else if (state
            is IndemnityEncashmentValidationPaymentMonthEmptyState) {
          _indemnityEncashmentErrorMassage.paymentMonth =
              state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.paymentMonth);
        } else if (state
            is IndemnityEncashmentValidationPaymentMonthValidState) {
          _indemnityEncashmentErrorMassage.paymentMonth = null;
        } else if (state
            is IndemnityEncashmentValidationPaymentMethodEmptyState) {
          _indemnityEncashmentErrorMassage.paymentMethod =
              state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.paymentMethod);
        } else if (state
            is IndemnityEncashmentValidationPaymentMethodValidState) {
          _indemnityEncashmentErrorMassage.paymentMethod = null;
        } else if (state is IndemnityEncashmentValidationRemarksEmptyState) {
          _indemnityEncashmentErrorMassage.remarks = state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.remarks);
          _isValidRemarks = false;
        } else if (state is IndemnityEncashmentValidationRemarksValidState) {
          _indemnityEncashmentErrorMassage.remarks = null;
          _isValidRemarks = true;
        } else if (state is IndemnityEncashmentValidationFileEmptyState) {
          _indemnityEncashmentErrorMassage.file = state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.file);
          _fileIsMandatory = true;
        } else if (state is IndemnityEncashmentValidationFileValidState) {
          _indemnityEncashmentErrorMassage.file = null;
          _fileIsMandatory = false;
        } else if (state
            is IndemnityEncashmentValidationRequestedDaysNotValidState) {
          _indemnityEncashmentErrorMassage.requestedDays =
              state.validationMassage;
          _animateTo(_indemnityEncashmentGlobalKey.requestedDays);
        } else if (state is IndemnityEncashmentSubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(IndemnityEncashmentBackEvent());
            _bloc.add(IndemnityEncashmentBackEvent());
          });
        } else if (state is IndemnityEncashmentGetPaymentMethodSuccessState) {
          _indemnityEncashmentPaymentMethods = state.paymentMethods;
        } else if (state is IndemnityEncashmentGetPaymentMethodErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(IndemnityEncashmentBackEvent());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).indemnityEncashment,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(IndemnityEncashmentBackEvent());
          }),
          body: IndemnityEncashmentContentWidget(
            indemnitiesEncashment: _indemnitiesEncashment,
            isValidLeaveRemarks: _isValidRemarks,
            fileIsMandatory: _fileIsMandatory,
            filePath: _filePath,
            indemnityEncashmentController: _indemnityEncashmentController,
            indemnityEncashmentGlobalKey: _indemnityEncashmentGlobalKey,
            indemnityEncashmentErrorMassage: _indemnityEncashmentErrorMassage,
            indemnityEncashmentFunctions: IndemnityEncashmentFunctions(
              onSelectRadioButton: (SingleSelectionModel selectionModel) {},
              onTapPaymentMethod: () {
                _bloc.add(
                    IndemnityEncashmentOpenPaymentMethodBottomSheetEvent());
              },
              onChangeRemarks: (String value, bool isMandatory) {
                _bloc.add(IndemnityEncashmentValidationRemarksEvent(
                    value: value, isMandatory: isMandatory));
              },
              deleteFileAction: (String filePath, bool isMandatory) {
                _deleteFile(filePath, isMandatory);
              },
              showUploadFileBottomSheet: (bool isMandatory) {
                _bloc.add(IndemnityEncashmentOpenUploadFileEvent(
                    isMandatory: isMandatory));
              },
              onChangeRequestedDays: (String value) {
                _bloc.add(IndemnityEncashmentValidationRequestedDaysEvent(
                    value: value));
              },
              onPickPaymentMonth: (String value) {
                _paymentMonth = value;
                _bloc.add(IndemnityEncashmentValidationPaymentMonthEvent(
                    value: value));
              },
              onPickRequestedDate: (String value) {
                _requestedDate = value;
                _bloc.add(IndemnityEncashmentValidationRequestedDateEvent(
                    value: value));
              },
              onDeletePaymentMonthAction: () {
                _bloc.add(
                    IndemnityEncashmentValidationPaymentMonthEvent(value: ''));
              },
              onDeleteRequestedDateAction: () {
                _bloc.add(
                    IndemnityEncashmentValidationRequestedDateEvent(value: ''));
              },
              onTapSubmit: () {
                _bloc.add(
                  IndemnityEncashmentSubmitEvent(
                      indemnityEncashmentController:
                          _indemnityEncashmentController,
                      paymentMonth: _paymentMonth,
                      requestedDate: _requestedDate,
                      indemnitiesEncashment: _indemnitiesEncashment,
                      file: _filePath),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _onIndemnityEncashmentOpenPaymentMethodBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _indemnityEncashmentPaymentMethods,
        paymentMethod: _indemnityEncashmentPaymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _indemnityEncashmentPaymentMethod = value;
      _bloc.add(IndemnityEncashmentSelectPaymentMethodEvent(
        value: value,
      ));
    });
  }

  void _onIndemnityEncashmentOpenUploadFileState(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () => _bloc
            .add(IndemnityEncashmentOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () => _bloc
            .add(IndemnityEncashmentOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () => _bloc
            .add(IndemnityEncashmentOpenFileEvent(isMandatory: isMandatory)),
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
          _bloc.add(IndemnityEncashmentBackEvent());
          _bloc.add(IndemnityEncashmentSelectFileEvent(
              value: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(IndemnityEncashmentBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(IndemnityEncashmentBackEvent());
                  _bloc.add(IndemnityEncashmentSelectFileEvent(
                      value: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(IndemnityEncashmentBackEvent());
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
          _bloc.add(IndemnityEncashmentBackEvent());
          _bloc.add(IndemnityEncashmentSelectFileEvent(
              value: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(IndemnityEncashmentBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(IndemnityEncashmentBackEvent());
                  _bloc.add(IndemnityEncashmentSelectFileEvent(
                      value: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(IndemnityEncashmentBackEvent());
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
        _bloc.add(IndemnityEncashmentBackEvent());
        _bloc.add(IndemnityEncashmentSelectFileEvent(
            value: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(IndemnityEncashmentBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(IndemnityEncashmentBackEvent());
                _bloc.add(IndemnityEncashmentSelectFileEvent(
                    value: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(IndemnityEncashmentBackEvent());
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
        _bloc.add(IndemnityEncashmentBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(IndemnityEncashmentBackEvent());
        _bloc.add(IndemnityEncashmentDeleteFileEvent(
            value: value, isMandatory: isMandatory));
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
