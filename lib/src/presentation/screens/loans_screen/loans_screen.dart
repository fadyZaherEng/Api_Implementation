import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/decimal_text_input_formatter.dart';
import 'package:talent_link/src/core/utils/permission_service_handler.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/loans/loans_bloc.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_controller.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_error_massage.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_functions.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/utils/loans_global_key.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/widgets/loan_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class LoansScreen extends BaseStatefulWidget {
  const LoansScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoansScreenState();
}

class _LoansScreenState extends BaseState<LoansScreen> {
  LoansBloc get _bloc => BlocProvider.of<LoansBloc>(context);
  final LoansErrorMassage _loansErrorMassage = LoansErrorMassage();
  bool _checkBoxSelection = false;
  bool _isVisiblePaymentMethod = false;
  int _isByCurrentBalance = 0;
  int _isPayroll = 0;
  bool _fileIsMandatory = false;
  bool _isValidLeaveRemarks = true;
  String _startDate = '';
  String _requestedDate = '';
  String _filePath = '';
  List<AllFieldsMandatory> _allFieldsMandatory = [];
  List<RequestType> _loanTypes = [];
  RequestType _loanType = RequestType(id: 0, name: '');
  List<RequestPaymentMethod> _loanPaymentMethods = [];
  RequestPaymentMethod _loanPaymentMethod =
      RequestPaymentMethod(id: 0, name: '');
  final _picker = ImagePicker();
  final LoansController _loansController = LoansController(
    type: TextEditingController(),
    loanRequestedAmount: TextEditingController(),
    profitRate: TextEditingController(),
    loanTotalAmount: TextEditingController(),
    installments: TextEditingController(),
    paymentMethod: TextEditingController(),
    remarks: TextEditingController(),
  );
  final LoansGlobalKey _loansGlobalKey = LoansGlobalKey(
      type: GlobalKey(),
      loanRequestedDate: GlobalKey(),
      loanStartDate: GlobalKey(),
      loanRequestedAmount: GlobalKey(),
      profitRate: GlobalKey(),
      loanTotalAmount: GlobalKey(),
      installments: GlobalKey(),
      paymentMethod: GlobalKey(),
      remarks: GlobalKey(),
      file: GlobalKey());
  late List<TextInputFormatter>? _installmentsFormatter = [
    FilteringTextInputFormatter.digitsOnly
  ];

  @override
  void initState() {
    _bloc.add(GetLoanTypesEvent());
    _bloc.add(LoanGetPaymentMethodEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LoansBloc, LoansState>(
      listener: (context, state) {
        if (state is LoansLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is LoansBackState) {
          Navigator.pop(context);
        } else if (state is LoansOpenTypeBottomSheetState) {
          _onLoanOpenTypeBottomSheetState();
        } else if (state is LoansSelectTypeState) {
          _loansController.type.text = state.requestType.name;
          _bloc.add(LoanGetAllFieldsMandatoryEvent(
              requestTypeId: 6, requestData: state.requestType.id));
        } else if (state is LoansSelectCheckBoxValueState) {
          _checkBoxSelection = state.value;
          if (state.value) {
            _installmentsFormatter = [DecimalTextInputFormatter()];
          } else {
            _installmentsFormatter = [FilteringTextInputFormatter.digitsOnly];
          }
          state.value ? _isByCurrentBalance = 1 : _isByCurrentBalance = 0;
          _loansController.installments.text = '';
          _bloc.add(LoansValidationInstallmentsEvent(value: ''));
        } else if (state is LoansOpenPaymentMethodBottomSheetState) {
          _onLoanOpenPaymentMethodBottomSheetState();
        } else if (state is LoansSelectPaymentMethodState) {
          _loansController.paymentMethod.text = state.loanPaymentMethod.name;
        } else if (state is LoansOpenUploadFileBottomSheetState) {
          _onLoanOpenUploadFileBottomSheetState(state.isMandatory);
        } else if (state is LoansOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is LoansOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is LoansOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is LoansSelectFileState) {
          _filePath = state.filePath;
        } else if (state is LoansDeleteFileState) {
          _filePath = state.filePath;
        } else if (state is LoansValidationTypeEmptyState) {
          _loansErrorMassage.type = state.validationMassage;
          _animateTo(_loansGlobalKey.type);
        } else if (state is LoansValidationTypeValidState) {
          _loansErrorMassage.type = null;
        } else if (state is LoanValidationRequestedDateEmptyState) {
          _loansErrorMassage.loanRequestedDate = state.validationMassage;
          _animateTo(_loansGlobalKey.loanRequestedDate);
        } else if (state is LoansValidationRequestedDateValidState) {
          _loansErrorMassage.loanRequestedDate = null;
        } else if (state is LoanValidationStartDateEmptyState) {
          _loansErrorMassage.loanStartDate = state.validationMassage;
          _animateTo(_loansGlobalKey.loanStartDate);
        } else if (state is LoansValidationStartDateValidState) {
          _loansErrorMassage.loanStartDate = null;
        } else if (state is LoanValidationLoanRequestedAmountEmptyState) {
          _loansErrorMassage.loanRequestedAmount = state.validationMassage;
          _animateTo(_loansGlobalKey.loanRequestedAmount);
        } else if (state is LoansValidationLoanRequestedAmountValidState) {
          _calculateTotalAmount();
          _loansErrorMassage.loanRequestedAmount = null;
        } else if (state is LoanValidationProfitRateEmptyState) {
          _loansErrorMassage.profitRate = state.validationMassage;
          _animateTo(_loansGlobalKey.profitRate);
        } else if (state is LoansValidationProfitRateValidState) {
          _calculateTotalAmount();
          _loansErrorMassage.profitRate = null;
        } else if (state is LoanValidationTotalAmountEmptyState) {
          _loansErrorMassage.loanTotalAmount = state.validationMassage;
          _animateTo(_loansGlobalKey.loanTotalAmount);
        } else if (state is LoansValidationTotalAmountValidState) {
          _loansErrorMassage.loanTotalAmount = null;
        } else if (state is LoansValidationInstallmentsEmptyState) {
          _loansErrorMassage.installments = state.validationMassage;
          _animateTo(_loansGlobalKey.installments);
        } else if (state is LoansValidationInstallmentsValidState) {
          _loansErrorMassage.installments = null;
        } else if (state is LoanValidationPaymentMethodEmptyState) {
          _loansErrorMassage.paymentMethod = state.validationMassage;
          _animateTo(_loansGlobalKey.paymentMethod);
        } else if (state is LoansValidationPaymentMethodValidState) {
          _loansErrorMassage.paymentMethod = null;
        } else if (state is LoansValidationRemarksEmptyState) {
          _loansErrorMassage.remarks = state.validationMassage;
          _isValidLeaveRemarks = false;
          _animateTo(_loansGlobalKey.remarks);
        } else if (state is LoansValidationRemarksValidState) {
          _loansErrorMassage.remarks = null;
          _isValidLeaveRemarks = true;
        } else if (state is LoansValidationFileEmptyState) {
          _loansErrorMassage.file = state.validationMassage;
          _fileIsMandatory = true;
          _animateTo(_loansGlobalKey.file);
        } else if (state is LoansValidationFileValidState) {
          _loansErrorMassage.file = null;
          _fileIsMandatory = false;
        } else if (state is InsertLoanSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(LoansBackEvent());
            _bloc.add(LoansBackEvent());
          });
        } else if (state is GetLoanTypesSuccessState) {
          _loanTypes = state.requestTypes;
        } else if (state is GetLoanTypesErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LoansBackEvent());
          });
        } else if (state is LoanGetPaymentMethodSuccessState) {
          _loanPaymentMethods = state.paymentMethods;
        } else if (state is LoanGetPaymentMethodErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LoansBackEvent());
          });
        } else if (state is LoanShowPaymentMethodTextFieldState) {
          _isVisiblePaymentMethod = state.isVisiblePaymentMethod;
          state.isVisiblePaymentMethod ? _isPayroll = 0 : _isPayroll = 1;
          if (state.isVisiblePaymentMethod == false) {
            _loanPaymentMethod = RequestPaymentMethod(id: 0, name: '');
            _loansController.paymentMethod.text = '';
            _loansErrorMassage.paymentMethod = null;
          }
        } else if (state is LoanGetAllFieldsMandatorySuccessState) {
          _allFieldsMandatory = state.allFieldsMandatory;
        } else if (state is LoanGetAllFieldsMandatoryErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LoansBackEvent());
          });
        } else if (state is LoanCalculateInCaseLoanErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(LoansBackEvent());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).loans,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(LoansBackEvent());
          }),
          body: LoansContentWidget(
            installmentsFormatter: _installmentsFormatter,
            allFieldsMandatory: _allFieldsMandatory,
            checkBoxSelection: _checkBoxSelection,
            fileIsMandatory: _fileIsMandatory,
            filePath: _filePath,
            isValidLeaveRemarks: _isValidLeaveRemarks,
            loansController: _loansController,
            loansErrorMassage: _loansErrorMassage,
            loansGlobalKey: _loansGlobalKey,
            loansFunctions: LoansFunctions(
              onTapType: () {
                _bloc.add(LoansOpenTypeBottomSheetEvent());
              },
              onSelectRadioButton: (SingleSelectionModel selectionModel) {
                _bloc.add(LoanShowPaymentMethodTextFieldEvent(
                    selectionModel: selectionModel));
              },
              onTapPaymentMethod: () {
                _bloc.add(LoansOpenPaymentMethodBottomSheetEvent());
              },
              checkboxAction: () {
                _bloc.add(
                    LoansSelectCheckBoxValueEvent(value: !_checkBoxSelection));
              },
              onChangeRemarks: (String value, bool isMandatory) {
                _bloc.add(LoansValidationRemarksEvent(
                    value: value, isMandatory: isMandatory));
              },
              showUploadFileBottomSheet: (bool isMandatory) {
                _bloc.add(LoansOpenUploadFileBottomSheetEvent(
                    isMandatory: isMandatory));
              },
              deleteFileAction: (String value, bool isMandatory) {
                _deleteFile(value, isMandatory);
              },
              onChangeInstallments: (String value) {
                _bloc.add(LoansValidationInstallmentsEvent(value: value));
              },
              onChangeLoanRequestedAmount: (String value) {
                _bloc
                    .add(LoansValidationLoanRequestedAmountEvent(value: value));
              },
              onChangeLoanTotalAmount: (String value) {
                _bloc.add(LoansValidationTotalAmountEvent(value: value));
              },
              onChangeProfitRate: (String value) {
                _bloc.add(LoansValidationProfitRateEvent(value: value));
              },
              onDeleteLoanRequestedDateAction: () {
                _bloc.add(LoansDeleteLoanRequestedDateEvent());
              },
              onDeleteLoanStartDateAction: () {
                _bloc.add(LoansDeleteLoanStartDateEvent());
              },
              onPickLoanRequestedDate: (String value) {
                _requestedDate = value;
                _bloc.add(LoansValidationRequestedDateEvent(value: value));
              },
              onPickLoanStartDate: (String value) {
                _startDate = value;
                _bloc.add(LoansValidationStartDateEvent(value: value));
              },
              onTapSubmit: () {
                _bloc.add(LoansSubmitEvent(
                  file: _filePath,
                  startDate: _startDate,
                  requestedDate: _requestedDate,
                  allFieldsMandatory: _allFieldsMandatory,
                  loansController: _loansController,
                  isVisiblePaymentMethod: _isVisiblePaymentMethod,
                  paymentMethodId: _loanPaymentMethod.id,
                  typeId: _loanType.id,
                  isPayroll: _isPayroll,
                  isByCurrentBalance: _isByCurrentBalance,
                ));
              },
            ),
            isVisiblePaymentMethod: _isVisiblePaymentMethod,
          ),
        );
      },
    );
  }

  void _onLoanOpenTypeBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _loanTypes,
        requestType: _loanType,
      ),
      titleLabel: S.of(context).type,
    ).then((value) {
      _loanType = value;
      _bloc.add(LoansSelectTypeEvent(
        requestType: value,
      ));
    });
  }

  void _onLoanOpenPaymentMethodBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _loanPaymentMethods,
        paymentMethod: _loanPaymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _loanPaymentMethod = value;
      _bloc.add(LoansSelectPaymentMethodEvent(
        loanPaymentMethod: value,
        isVisiblePaymentMethod: _isVisiblePaymentMethod,
      ));
    });
  }

  void _onLoanOpenUploadFileBottomSheetState(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(LoansOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () =>
            _bloc.add(LoansOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(LoansOpenFileEvent(isMandatory: isMandatory)),
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
          _bloc.add(LoansBackEvent());
          _bloc.add(LoansSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(LoansBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(LoansBackEvent());
                  _bloc.add(LoansSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LoansBackEvent());
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
          _bloc.add(LoansBackEvent());
          _bloc.add(LoansSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(LoansBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(LoansBackEvent());
                  _bloc.add(LoansSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LoansBackEvent());
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
        _bloc.add(LoansBackEvent());
        _bloc.add(LoansSelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(LoansBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(LoansBackEvent());
                _bloc.add(LoansSelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(LoansBackEvent());
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
        _bloc.add(LoansBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(LoansBackEvent());
        _bloc.add(
            LoansDeleteFileEvent(filePath: value, isMandatory: isMandatory));
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

  void _calculateTotalAmount() {
    int loanRequestedAmount = 0;
    int profitRate = 0;
    if (_loansController.profitRate.text.isNotEmpty) {
      profitRate = int.parse(_loansController.profitRate.text).toInt();
    }
    if (_loansController.loanRequestedAmount.text.isNotEmpty) {
      loanRequestedAmount =
          int.parse(_loansController.loanRequestedAmount.text).toInt();
    }
    double loanTotalAmount =
        loanRequestedAmount.toDouble() * profitRate.toDouble() / 100;
    _loansController.loanTotalAmount.text = loanTotalAmount.toString();
    _bloc.add(
        LoansValidationTotalAmountEvent(value: loanTotalAmount.toString()));
  }
}


