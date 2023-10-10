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
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/model/remote_get_employee_policy_profile_leave_encashment_details.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/leave_encashment/leave_encashment_bloc.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_controller.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_error_massage.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_functions.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/utils/leave_encashment_global_key.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/widgets/leave_encashment_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class LeaveEncashmentScreen extends BaseStatefulWidget {
  const LeaveEncashmentScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _LeaveEncashmentScreenState();
}

class _LeaveEncashmentScreenState extends BaseState<LeaveEncashmentScreen> {
  LeaveEncashmentBloc get _bloc =>
      BlocProvider.of<LeaveEncashmentBloc>(context);
  bool _checkBoxSelection = false;
  bool _isValidLeaveRemarks = true;
  bool _fileIsMandatory = false;
  String _filePath = '';
  String _requestDate = '';
  final _picker = ImagePicker();
  int _isByPayroll = 0;
  int _isByCurrentBalance = 0;
  bool _isVisiblePaymentMethod = false;
  List<RequestType> _leaveEncashmentTypes = [];
  RequestType _leaveEncashmentType = RequestType(id: 0, name: '');
  List<RequestPaymentMethod> _requestPaymentMethods = [];
  RequestPaymentMethod _requestPaymentMethod =
      RequestPaymentMethod(id: 0, name: '');
  List<AllFieldsMandatory> _allFieldsMandatory = [];
  final LeaveEncashmentErrorMassage _leaveEncashmentErrorMassage =
      LeaveEncashmentErrorMassage();
  final LeaveEncashmentController _leaveEncashmentController =
      LeaveEncashmentController(
    type: TextEditingController(),
    requestedDays: TextEditingController(),
    paymentMethod: TextEditingController(),
    currentBalance: TextEditingController(),
    totalAmount: TextEditingController(),
    remainingBalance: TextEditingController(),
    yearlyBalance: TextEditingController(),
    remarks: TextEditingController(),
  );

  final LeaveEncashmentGlobalKey _leaveEncashmentGlobalKey =
      LeaveEncashmentGlobalKey(
    type: GlobalKey(),
    requestedDate: GlobalKey(),
    requestedDays: GlobalKey(),
    paymentMethod: GlobalKey(),
    currentBalance: GlobalKey(),
    yearlyBalance: GlobalKey(),
    remainingBalance: GlobalKey(),
    totalAmount: GlobalKey(),
    remarks: GlobalKey(),
    uploadFile: GlobalKey(),
  );
  List<RemoteGetEmployeePolicyProfileLeaveEncashmentDetails> _maxDaysList = [];

  @override
  void initState() {
    _bloc.add(GetLeaveEncashmentTypesEvent());
    _bloc.add(GetLeaveEncashmentPaymentMethodEvent());
    _bloc.add(GetEmployeePolicyProfileLeaveEncashmentDetailsEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LeaveEncashmentBloc, LeaveEncashmentState>(
        listener: (context, state) {
      if (state is LeaveEncashmentLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is LeaveEncashmentBackState) {
        Navigator.pop(context);
      } else if (state is LeaveEncashmentOpenTypeBottomSheetState) {
        _onLeaveEncashmentOpenTypeBottomSheetState();
      } else if (state is LeaveEncashmentSelectTypeState) {
        _leaveEncashmentController.type.text = state.leaveEncashmentType.name;
      } else if (state is LeaveEncashmentOpenPaymentMethodBottomSheetState) {
        _onLeaveEncashmentOpenPaymentMethodBottomSheetState();
      } else if (state is LeaveEncashmentSelectPaymentMethodState) {
        _leaveEncashmentController.paymentMethod.text =
            state.requestPaymentMethod.name;
      } else if (state is LeaveEncashmentSelectCheckBoxValueState) {
        _checkBoxSelection = state.checkBoxSelection;
        state.checkBoxSelection
            ? _isByCurrentBalance = 1
            : _isByCurrentBalance = 0;
      } else if (state is LeaveEncashmentOpenUploadFileBottomSheetState) {
        _onLeaveEncashmentOpenUploadFileBottomSheetState(state.isMandatory);
      } else if (state is LeaveEncashmentOpenCameraState) {
        _openCamera(state.isMandatory);
      } else if (state is LeaveEncashmentOpenGalleryState) {
        _openGallery(state.isMandatory);
      } else if (state is LeaveEncashmentOpenFileState) {
        _openFile(state.isMandatory);
      } else if (state is LeaveEncashmentSelectFileState) {
        _filePath = state.filePath;
        _bloc.add(LeaveEncashmentBackEvent());
      } else if (state is LeaveEncashmentDeleteFileState) {
        _filePath = state.filePath;
      } else if (state is LeaveEncashmentTypeEmptyState) {
        _leaveEncashmentErrorMassage.type = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.type);
      } else if (state is LeaveEncashmentTypeValidState) {
        _leaveEncashmentErrorMassage.type = null;
      } else if (state is LeaveEncashmentRequestDateEmptyState) {
        _leaveEncashmentErrorMassage.requestedDate = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.requestedDate);
      } else if (state is LeaveEncashmentRequestDateValidState) {
        _leaveEncashmentErrorMassage.requestedDate = null;
      } else if (state is LeaveEncashmentRequestDaysEmptyState) {
        _leaveEncashmentErrorMassage.requestedDays = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.requestedDays);
      } else if (state is LeaveEncashmentRequestDaysValidState) {
        _leaveEncashmentErrorMassage.requestedDays = null;
      } else if (state is LeaveEncashmentPaymentMethodEmptyState) {
        _leaveEncashmentErrorMassage.paymentMethod = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.paymentMethod);
      } else if (state is LeaveEncashmentPaymentMethodValidState) {
        _leaveEncashmentErrorMassage.paymentMethod = null;
      } else if (state is LeaveEncashmentCurrentBalanceEmptyState) {
        _leaveEncashmentErrorMassage.currentBalance = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.currentBalance);
      } else if (state is LeaveEncashmentCurrentBalanceValidState) {
        _leaveEncashmentErrorMassage.currentBalance = null;
      } else if (state is LeaveEncashmentYearlyBalanceEmptyState) {
        _leaveEncashmentErrorMassage.yearlyBalance = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.yearlyBalance);
      } else if (state is LeaveEncashmentYearlyBalanceValidState) {
        _leaveEncashmentErrorMassage.yearlyBalance = null;
      } else if (state is LeaveEncashmentRemainingBalanceEmptyState) {
        _leaveEncashmentErrorMassage.remainingBalance = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.remainingBalance);
      } else if (state is LeaveEncashmentRemainingBalanceValidState) {
        _leaveEncashmentErrorMassage.remainingBalance = null;
      } else if (state is LeaveEncashmentTotalAmountEmptyState) {
        _leaveEncashmentErrorMassage.totalAmount = state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.totalAmount);
      } else if (state is LeaveEncashmentTotalAmountValidState) {
        _leaveEncashmentErrorMassage.totalAmount = null;
      } else if (state is LeaveEncashmentRemarksEmptyState) {
        _leaveEncashmentErrorMassage.remarks = state.validationMessage;
        _isValidLeaveRemarks = false;
        _animateTo(_leaveEncashmentGlobalKey.remarks);
      } else if (state is LeaveEncashmentRemarksValidState) {
        _leaveEncashmentErrorMassage.remarks = null;
        _isValidLeaveRemarks = true;
      } else if (state is LeaveEncashmentFileEmptyState) {
        _leaveEncashmentErrorMassage.file = state.validationMessage;
        _fileIsMandatory = true;
        _animateTo(_leaveEncashmentGlobalKey.uploadFile);
      } else if (state is LeaveEncashmentFileValidState) {
        _leaveEncashmentErrorMassage.file = null;
        _fileIsMandatory = false;
      } else if (state is InsertLeaveEncashmentSuccessState) {
        _massageDialog(state.successMassage, () {
          _bloc.add(LeaveEncashmentBackEvent());
          _bloc.add(LeaveEncashmentBackEvent());
        });
      } else if (state is GetLeaveEncashmentTypesSuccessState) {
        _leaveEncashmentTypes = state.types;
      } else if (state is GetLeaveEncashmentTypesErrorState) {
        _massageDialog(state.errorMassage, () {
          _bloc.add(LeaveEncashmentBackEvent());
        });
      } else if (state is GetLeaveEncashmentPaymentMethodSuccessState) {
        _requestPaymentMethods = state.paymentMethods;
      } else if (state is GetLeaveEncashmentPaymentMethodErrorState) {
        _massageDialog(state.errorMassage, () {
          _bloc.add(LeaveEncashmentBackEvent());
        });
      } else if (state is InsertLeaveEncashmentErrorState) {
        _massageDialog(state.errorMassage, () {
          _bloc.add(LeaveEncashmentBackEvent());
        });
      } else if (state is LeaveEncashmentShowPaymentMethodTextFieldState) {
        _isVisiblePaymentMethod = state.isVisiblePaymentMethod;
        if (state.isVisiblePaymentMethod == false) {
          _requestPaymentMethod = RequestPaymentMethod(id: 0, name: '');
          _leaveEncashmentController.paymentMethod.text = '';
          _leaveEncashmentErrorMassage.paymentMethod = null;
        }
      } else if (state is LeaveEncashmentGetAllFieldsMandatorySuccessState) {
        _allFieldsMandatory = state.allFieldsMandatory;
      } else if (state is LeaveEncashmentGetAllFieldsMandatoryErrorState) {
        _massageDialog(state.errorMassage, () {
          _bloc.add(LeaveEncashmentBackEvent());
        });
      } else if (state
          is GetEmployeePolicyProfileLeaveEncashmentDetailsSuccessState) {
        _maxDaysList = state.employeePolicyProfileLeaveEncashmentDetails;
      } else if (state
          is GetEmployeePolicyProfileLeaveEncashmentDetailsErrorState) {
        _massageDialog(state.errorMassage, () {
          _bloc.add(LeaveEncashmentBackEvent());
        });
      }else if(state is LeaveEncashmentRequestDaysNotValidState){
        _leaveEncashmentErrorMassage.requestedDays =state.validationMessage;
        _animateTo(_leaveEncashmentGlobalKey.requestedDays);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: buildAppBarWidget(context,
            title: S.of(context).leaveEncashment,
            isHaveBackButton: true, onBackButtonPressed: () {
          _bloc.add(LeaveEncashmentBackEvent());
        }),
        body: LeaveEncashmentContentWidget(
          filePath: _filePath,
          checkBoxSelection: _checkBoxSelection,
          isValidLeaveRemarks: _isValidLeaveRemarks,
          fileIsMandatory: _fileIsMandatory,
          allFieldsMandatory: _allFieldsMandatory,
          leaveEncashmentGlobalKey: _leaveEncashmentGlobalKey,
          leaveEncashmentErrorMassage: _leaveEncashmentErrorMassage,
          leaveEncashmentController: _leaveEncashmentController,
          leaveEncashmentFunctions: LeaveEncashmentFunctions(
            onTapType: () {
              _bloc.add(LeaveEncashmentOpenTypeBottomSheetEvent());
            },
            onPickRequestedDate: (String value) {
              _requestDate = value;
              _bloc.add(LeaveEncashmentValidationRequestDateEvent(
                  requestDate: value));
            },
            onDeleteRequestedDateAction: () {
              _requestDate = '';
              _bloc.add(
                  LeaveEncashmentValidationRequestDateEvent(requestDate: ''));
            },
            onChangeRequestedDays: (String value) {
              _bloc.add(LeaveEncashmentValidationRequestDaysEvent(
                  requestDays: value, maxDays: _maxDaysList[0]));
            },
            onSelectRadioButton: (SingleSelectionModel value) {
              _isByPayroll = value.id;
              _bloc.add(LeaveEncashmentShowPaymentMethodTextFieldEvent(
                  singleSelectionModel: value));
            },
            onTapPaymentMethod: () {
              _bloc.add(LeaveEncashmentOpenPaymentMethodBottomSheetEvent());
            },
            checkboxAction: () {
              _bloc.add(LeaveEncashmentSelectCheckBoxValueEvent(
                  checkBoxSelection: !_checkBoxSelection));
            },
            onChangeCurrentBalance: (String value, bool isMandatory) {
              _bloc.add(LeaveEncashmentValidationCurrentBalanceEvent(
                  currentBalance: value, isMandatory: isMandatory));
            },
            onChangeYearlyBalance: (String value, bool isMandatory) {
              _bloc.add(LeaveEncashmentValidationYearlyBalanceEvent(
                  yearlyBalance: value, isMandatory: isMandatory));
            },
            onChangeRemainingBalance: (String value, bool isMandatory) {
              _bloc.add(LeaveEncashmentValidationRemainingBalanceEvent(
                  remainingBalance: value, isMandatory: isMandatory));
            },
            onChangeTotalAmount: (String value, bool isMandatory) {
              _bloc.add(LeaveEncashmentValidationTotalAmountEvent(
                  totalAmount: value, isMandatory: isMandatory));
            },
            onChangeRemarks: (String value, bool isMandatory) {
              _bloc.add(LeaveEncashmentValidationRemarksEvent(
                  remarks: value, isMandatory: isMandatory));
            },
            showUploadFileBottomSheet: (bool isMandatory) {
              _bloc.add(LeaveEncashmentOpenUploadFileBottomSheetEvent(
                  isMandatory: isMandatory));
            },
            deleteFileAction: (String value, bool isMandatory) {
              _deleteFile(value, isMandatory);
            },
            onTapSubmit: () {
              _bloc.add(LeaveEncashmentSubmitEvent(
                leaveEncashmentController: _leaveEncashmentController,
                requestDate: _requestDate,
                allFieldsMandatory: _allFieldsMandatory,
                file: _filePath,
                isByPayroll: _isByPayroll,
                isByCurrentBalance: _isByCurrentBalance,
                isVisiblePaymentMethod: _isVisiblePaymentMethod,
                typeID: _leaveEncashmentType.id,
                paymentMethodId: _requestPaymentMethod.id,
                maxDays: _maxDaysList[0],
              ));
            },
          ),
          isVisiblePaymentMethod: _isVisiblePaymentMethod,
        ),
      );
    });
  }

  void _onLeaveEncashmentOpenTypeBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _leaveEncashmentTypes,
        requestType: _leaveEncashmentType,
      ),
      titleLabel: S.of(context).type,
    ).then((value) {
      _leaveEncashmentType = value;
      _bloc.add(LeaveEncashmentSelectTypeEvent(
        leaveEncashmentType: value,
      ));
    });
  }

  void _onLeaveEncashmentOpenPaymentMethodBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _requestPaymentMethods,
        paymentMethod: _requestPaymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _requestPaymentMethod = value;
      _bloc.add(LeaveEncashmentSelectPaymentMethodEvent(
        requestPaymentMethod: value,
        isVisiblePaymentMethod: _isVisiblePaymentMethod,
      ));
    });
  }

  void _onLeaveEncashmentOpenUploadFileBottomSheetState(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(LeaveEncashmentOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () => _bloc
            .add(LeaveEncashmentOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(LeaveEncashmentOpenFileEvent(isMandatory: isMandatory)),
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

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }

  void _openCamera(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.camera).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(LeaveEncashmentSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(LeaveEncashmentBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(LeaveEncashmentSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LeaveEncashmentBackEvent());
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
          _bloc.add(LeaveEncashmentSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(LeaveEncashmentBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(LeaveEncashmentSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          Navigator.pop(context);
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
        _bloc.add(LeaveEncashmentSelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(LeaveEncashmentBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(LeaveEncashmentSelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LeaveEncashmentBackEvent());
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
        _bloc.add(LeaveEncashmentBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(LeaveEncashmentBackEvent());
        _bloc.add(LeaveEncashmentDeleteFileEvent(
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
}
