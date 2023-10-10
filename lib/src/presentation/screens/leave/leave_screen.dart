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
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/presentation/blocs/leave/leave_bloc.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_functions.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_global_key.dart';
import 'package:talent_link/src/presentation/screens/leave/utils/leave_text_controller.dart';
import 'package:talent_link/src/presentation/screens/leave/widgets/leave_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/leave_alternative_employee_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class LeaveScreen extends BaseStatefulWidget {
  const LeaveScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LeaveScreenState();
}

class _LeaveScreenState extends BaseState<LeaveScreen> {
  LeaveBloc get _bloc => BlocProvider.of<LeaveBloc>(context);
  List<RequestType> _leaveTypes = [];
  List<AllFieldsMandatory> _allFieldsMandatory = [];
  RequestType _leaveType = RequestType(id: 0, name: '');
  List<RequestPaymentMethod> _leavePaymentMethods = [];
  RequestPaymentMethod _leavePaymentMethod =
      RequestPaymentMethod(id: 0, name: '');
  List<LeaveAlternativeEmployee> _leaveAlternativeEmployees = [];
  LeaveAlternativeEmployee _leaveAlternativeEmployee =
      LeaveAlternativeEmployee(id: 0, name: '');
  bool _checkBoxSelection = false;
  bool _isValidLeaveReasons = true;
  bool _isValidLeaveRemarks = true;
  bool _fileIsMandatory = true;
  bool _isVisiblePaymentMethod = false;
  int _isByCurrentBalance = 0;
  String _filePath = '';
  String _startDate = '';
  String _endDate = '';
  String _expectedResumingDate = '';
  final _picker = ImagePicker();
  int _isByPayroll = 0;
  final LeaveErrorMassage _leaveErrorMassage = LeaveErrorMassage();
  final LeaveGlobalKey _leaveGlobalKey = LeaveGlobalKey(
    expectedResumingDateKey: GlobalKey(),
    contactNoKey: GlobalKey(),
    addressDuringLeaveKey: GlobalKey(),
    alternativeEmployeeKey: GlobalKey(),
    endDateKey: GlobalKey(),
    paymentMethodKey: GlobalKey(),
    startDateKey: GlobalKey(),
    typeKey: GlobalKey(),
    currentBalanceKey: GlobalKey(),
    yearlyBalanceKey: GlobalKey(),
    remainingBalanceKey: GlobalKey(),
    leaveDaysKey: GlobalKey(),
    totalAmountKey: GlobalKey(),
    uploadFileKey: GlobalKey(),
    remarksKey: GlobalKey(),
    reasonsKey: GlobalKey(),
  );
  final LeaveTextEditingController _leaveTextEditingController =
      LeaveTextEditingController(
    contactNoController: TextEditingController(),
    addressDuringLeaveController: TextEditingController(),
    alternativeEmployeeController: TextEditingController(),
    paymentMethodController: TextEditingController(),
    typeController: TextEditingController(),
    currentBalanceController: TextEditingController(),
    yearlyBalanceController: TextEditingController(),
    remainingBalanceController: TextEditingController(),
    leaveDaysController: TextEditingController(),
    totalAmountController: TextEditingController(),
    leaveReasonsController: TextEditingController(),
    remarksController: TextEditingController(),
  );

  @override
  void initState() {
    _bloc.add(GetLeaveAlternativeEmployeeEvent());
    _bloc.add(CallLeaveTypesApiEvent());
    _bloc.add(GetLeavePaymentMethodEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LeaveBloc, LeaveState>(
      listener: (BuildContext context, state) {
        if (state is LeaveLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is LeaveBackState) {
          Navigator.pop(context);
        } else if (state is OpenTypeBottomSheetState) {
          _onOpenTypeBottomSheetState();
        } else if (state is OpenAlternativeEmployeeBottomSheetState) {
          _onOpenAlternativeEmployeeBottomSheetState(
              isMandatory: state.isMandatory);
        } else if (state is OpenPaymentMethodBottomSheetState) {
          _onOpenPaymentMethodBottomSheetState();
        } else if (state is SelectCheckBoxValueState) {
          _checkBoxSelection = state.value;
          state.value ? _isByCurrentBalance = 1 : _isByCurrentBalance = 0;
        } else if (state is SelectLeaveTypeState) {
          _leaveTextEditingController.typeController.text =
              state.leaveType.name;
          _bloc.add(GetLeaveAllFieldsMandatoryEvent(
              requestTypeId: 1, requestData: state.leaveType.id));
        } else if (state is SelectPaymentMethodState) {
          _leaveTextEditingController.paymentMethodController.text =
              state.paymentMethod.name;
        } else if (state is SelectAlternativeEmployeeState) {
          _leaveTextEditingController.alternativeEmployeeController.text =
              state.alternativeEmployee.name;
        } else if (state is OpenUploadFileBottomSheetState) {
          _onOpenUploadFileBottomSheetState(state.isMandatory);
        } else if (state is LeaveOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is LeaveOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is LeaveOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is LeaveSelectFileState) {
          _filePath = state.filePath;
          _bloc.add(LeaveBackEvent());
        } else if (state is LeaveDeleteFileState) {
          _filePath = state.filePath;
        } else if (state is LeaveTypeEmptyState) {
          _leaveErrorMassage.typeErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.typeKey);
        } else if (state is LeaveTypeValidState) {
          _leaveErrorMassage.typeErrorMassage = null;
        } else if (state is LeaveStartDateEmptyState) {
          _leaveErrorMassage.startDateErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.startDateKey);
        } else if (state is LeaveStartDateValidState) {
          _leaveErrorMassage.startDateErrorMassage = null;
        } else if (state is LeaveEndDateEmptyState) {
          _leaveErrorMassage.endDateErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.endDateKey);
        } else if (state is LeaveEndDateValidState) {
          _leaveErrorMassage.endDateErrorMassage = null;
        } else if (state is LeavePaymentMethodEmptyState) {
          _leaveErrorMassage.paymentMethodErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.paymentMethodKey);
        } else if (state is LeavePaymentMethodValidState) {
          _leaveErrorMassage.paymentMethodErrorMassage = null;
        } else if (state is LeaveExpectedResumingDateEmptyState) {
          _leaveErrorMassage.expectedResumingDateErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.expectedResumingDateKey);
        } else if (state is LeaveExpectedResumingDateValidState) {
          _leaveErrorMassage.expectedResumingDateErrorMassage = null;
        } else if (state is LeaveContactNumberEmptyState) {
          _leaveErrorMassage.contactNoErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.contactNoKey);
        } else if (state is LeaveContactNumberValidState) {
          _leaveErrorMassage.contactNoErrorMassage = null;
        } else if (state is LeaveAddressDuringEmptyState) {
          _leaveErrorMassage.addressDuringLeaveErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.addressDuringLeaveKey);
        } else if (state is LeaveAddressDuringValidState) {
          _leaveErrorMassage.addressDuringLeaveErrorMassage = null;
        } else if (state is LeaveAlternativeEmployeeEmptyState) {
          _leaveErrorMassage.alternativeEmployeeErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.alternativeEmployeeKey);
        } else if (state is LeaveAlternativeEmployeeValidState) {
          _leaveErrorMassage.alternativeEmployeeErrorMassage = null;
        } else if (state is LeaveCurrentBalanceEmptyState) {
          _leaveErrorMassage.currentBalanceErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.currentBalanceKey);
        } else if (state is LeaveCurrantBalanceValidState) {
          _leaveErrorMassage.currentBalanceErrorMassage = null;
        } else if (state is LeaveYearlyBalanceEmptyState) {
          _leaveErrorMassage.yearlyBalanceErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.yearlyBalanceKey);
        } else if (state is LeaveYearlyBalanceValidState) {
          _leaveErrorMassage.yearlyBalanceErrorMassage = null;
        } else if (state is LeaveRemainingBalanceEmptyState) {
          _leaveErrorMassage.remainingBalanceErrorMassage =
              state.validationMessage;
          _animateTo(_leaveGlobalKey.remainingBalanceKey);
        } else if (state is LeaveRemainingBalanceValidState) {
          _leaveErrorMassage.remainingBalanceErrorMassage = null;
        } else if (state is LeaveDaysEmptyState) {
          _leaveErrorMassage.leaveDaysErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.leaveDaysKey);
        } else if (state is LeaveDaysValidState) {
          _leaveErrorMassage.leaveDaysErrorMassage = null;
        } else if (state is LeaveTotalAmountEmptyState) {
          _leaveErrorMassage.totalAmountErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.totalAmountKey);
        } else if (state is LeaveTotalAmountValidState) {
          _leaveErrorMassage.totalAmountErrorMassage = null;
        } else if (state is LeaveReasonsEmptyState) {
          _leaveErrorMassage.leaveReasonsErrorMassage = state.validationMessage;
          _isValidLeaveReasons = false;
          _animateTo(_leaveGlobalKey.reasonsKey);
        } else if (state is LeaveReasonsValidState) {
          _leaveErrorMassage.leaveReasonsErrorMassage = null;
          _isValidLeaveReasons = true;
        } else if (state is LeaveRemarksEmptyState) {
          _isValidLeaveRemarks = false;
          _leaveErrorMassage.remarksErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.remarksKey);
        } else if (state is LeaveRemarksValidState) {
          _isValidLeaveRemarks = true;
          _leaveErrorMassage.remarksErrorMassage = null;
        } else if (state is LeaveFileEmptyState) {
          _leaveErrorMassage.fileErrorMassage = state.validationMessage;
          _animateTo(_leaveGlobalKey.uploadFileKey);
        } else if (state is LeaveFileValidState) {
          _leaveErrorMassage.fileErrorMassage = null;
        } else if (state is LeaveSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(LeaveBackEvent());
            _bloc.add(LeaveBackEvent());
          });
        } else if (state is GetLeaveAlternativeEmployeeSuccessState) {
          _leaveAlternativeEmployees = state.alternativeEmployees;
        } else if (state is GetLeaveAlternativeEmployeeErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LeaveBackEvent());
          });
        } else if (state is CallLeaveTypesApiSuccessState) {
          _leaveTypes = state.requestTypes;
        } else if (state is CallLeaveTypesApiErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LeaveBackEvent());
          });
        } else if (state is LeaveShowPaymentMethodTextFieldState) {
          _isVisiblePaymentMethod = state.isVisiblePaymentMethod;
          state.isVisiblePaymentMethod ? _isByPayroll = 1 : _isByPayroll = 0;
          if (state.isVisiblePaymentMethod == false) {
            _leavePaymentMethod = RequestPaymentMethod(id: 0, name: '');
            _leaveTextEditingController.paymentMethodController.text = '';
            _leaveErrorMassage.paymentMethodErrorMassage = null;
          }
        } else if (state is GetLeavePaymentMethodSuccessState) {
          _leavePaymentMethods = state.paymentMethods;
        } else if (state is GetLeavePaymentMethodErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LeaveBackEvent());
          });
        } else if (state is GetLeaveAllFieldsMandatorySuccessState) {
          _allFieldsMandatory = state.allFieldsMandatory;
        } else if (state is GetLeaveAllFieldsMandatoryErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LeaveBackEvent());
          });
        } else if (state is InsertLeaveSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(LeaveBackEvent());
            _bloc.add(LeaveBackEvent());
          });
        } else if (state is InsertLeaveErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LeaveBackEvent());
          });
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).leave,
              isHaveBackButton: true,
              onBackButtonPressed: () => _bloc.add(LeaveBackEvent())),
          body: LeaveContentWidget(
            isVisiblePaymentMethod: _isVisiblePaymentMethod,
            allFieldsMandatory: _allFieldsMandatory,
            leaveGlobalKey: _leaveGlobalKey,
            leaveTextEditingController: _leaveTextEditingController,
            leaveErrorMassage: _leaveErrorMassage,
            leaveFunctions: LeaveFunctions(
              onChangeContactNo: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationContactNumberEvent(
                    contactNumber: value, isMandatory: isMandatory));
              },
              onChangeAddressDuringLeave: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationAddressDuringEvent(
                    addressDuring: value, isMandatory: isMandatory));
              },
              onDeleteEndDateAction: () {
                _bloc.add(LeaveValidationEndDateEvent(endDate: ''));
              },
              onDeletePickExpectedResumingDateAction: (bool isMandatory) {
                _bloc.add(LeaveValidationExpectedResumingDateEvent(
                    expectedResumingDate: '', isMandatory: isMandatory));
              },
              onDeleteStartDateAction: () {
                _bloc.add(LeaveValidationStartDateEvent(startDate: ''));
              },
              onPickEndDate: (String value) {
                _endDate = value;
                _bloc.add(LeaveValidationEndDateEvent(endDate: value));
              },
              onPickExpectedResumingDate: (String value, bool isMandatory) {
                _expectedResumingDate = value;
                _bloc.add(LeaveValidationExpectedResumingDateEvent(
                    expectedResumingDate: value, isMandatory: isMandatory));
              },
              onPickStartDate: (String value) {
                _startDate = value;
                _bloc.add(LeaveValidationStartDateEvent(startDate: value));
              },
              onSelectRadioButton: (SingleSelectionModel value) {
                _bloc.add(LeaveShowPaymentMethodTextFieldEvent(
                    singleSelectionModel: value));
              },
              onTapAlternativeEmployee: (bool isMandatory) {
                _bloc.add(OpenAlternativeEmployeeBottomSheetEvent(
                    isMandatory: isMandatory));
              },
              onTapPaymentMethod: () {
                _bloc.add(OpenPaymentMethodBottomSheetEvent());
              },
              onTapType: () {
                _bloc.add(OpenTypeBottomSheetEvent());
              },
              checkboxAction: () {
                _bloc.add(SelectCheckBoxValueEvent(value: _checkBoxSelection));
              },
              onChangeCurrentBalance: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationCurrantBalanceEvent(
                    currantBalance: value, isMandatory: isMandatory));
              },
              onChangeYearlyBalance: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationYearlyBalanceEvent(
                    yearlyBalance: value, isMandatory: isMandatory));
              },
              onChangeRemainingBalance: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationRemainingBalanceEvent(
                    remainingBalance: value, isMandatory: isMandatory));
              },
              onChangeLeaveDays: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationLeaveDaysEvent(
                    leaveDays: value, isMandatory: isMandatory));
              },
              onChangeTotalAmount: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationTotalAmountEvent(
                    totalAmount: value, isMandatory: isMandatory));
              },
              onChangeLeaveReasons: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationLeaveReasonsEvent(
                    leaveReasons: value, isMandatory: isMandatory));
              },
              onChangeRemarks: (String value, bool isMandatory) {
                _bloc.add(LeaveValidationRemarksEvent(
                    remarks: value, isMandatory: isMandatory));
              },
              showUploadFileBottomSheet: (bool isMandatory) {
                _bloc.add(
                    OpenUploadFileBottomSheetEvent(isMandatory: isMandatory));
              },
              deleteFileAction: (String value, bool isMandatory) {
                _deleteFile(value, isMandatory);
              },
              onTapSubmit: () {
                _bloc.add(LeaveSubmitEvent(
                  isByCurrentBalance: _isByCurrentBalance,
                  leaveTextEditingController: _leaveTextEditingController,
                  startDate: _startDate,
                  endDate: _endDate,
                  expectedResumingDate: _expectedResumingDate,
                  file: _filePath,
                  isVisiblePaymentMethod: _isVisiblePaymentMethod,
                  leaveTypeId: _leaveType.id,
                  leavePaymentMethod: _leavePaymentMethod.id,
                  alternativeEmployeeId: _leaveAlternativeEmployee.id,
                  isByPayroll: _isByPayroll,
                ));
              },
            ),
            checkBoxSelection: _checkBoxSelection,
            isValidLeaveReasons: _isValidLeaveReasons,
            isValidLeaveRemarks: _isValidLeaveRemarks,
            fileIsMandatory: _fileIsMandatory,
            filePath: _filePath,
          ),
        );
      },
    );
  }

  void _onOpenTypeBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _leaveTypes,
        requestType: _leaveType,
      ),
      titleLabel: S.of(context).type,
    ).then((value) {
      _leaveType = value;
      _bloc.add(SelectLeaveTypeEvent(
        leaveType: value,
        isVisiblePaymentMethod: _isVisiblePaymentMethod,
      ));
    });
  }

  void _onOpenAlternativeEmployeeBottomSheetState({required bool isMandatory}) {
    showBottomSheetWidget(
      context: context,
      content: LeaveAlternativeEmployeeBottomSheetWidget(
          leaveAlternativeEmployees: _leaveAlternativeEmployees,
          leaveAlternativeEmployee: _leaveAlternativeEmployee),
      titleLabel: S.of(context).alternativeEmployee,
    ).then((value) {
      _leaveAlternativeEmployee = value;
      _bloc.add(SelectAlternativeEmployeeEvent(
          alternativeEmployee: value, isMandatory: isMandatory));
    });
  }

  void _onOpenPaymentMethodBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _leavePaymentMethods,
        paymentMethod: _leavePaymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _leavePaymentMethod = value;
      _bloc.add(SelectPaymentMethodEvent(
        paymentMethod: value,
        isVisiblePaymentMethod: _isVisiblePaymentMethod,
      ));
    });
  }

  void _onOpenUploadFileBottomSheetState(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(LeaveOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () =>
            _bloc.add(LeaveOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(LeaveOpenFileEvent(isMandatory: isMandatory)),
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
          _bloc.add(LeaveSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(LeaveBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(LeaveSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LeaveBackEvent());
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
          _bloc.add(LeaveSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(LeaveBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(LeaveSelectFileEvent(
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
        _bloc.add(LeaveSelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(LeaveBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(LeaveSelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LeaveBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveStoragePermission,
      );
    }
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }

  void _deleteFile(String value, bool isMandatory) {
    _showActionDialog(
      onPrimaryAction: () {
        _bloc.add(LeaveBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(LeaveBackEvent());
        _bloc.add(
            LeaveDeleteFileEvent(filePath: value, isMandatory: isMandatory));
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
}
