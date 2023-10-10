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
import 'package:talent_link/src/domain/entities/business_trip/city.dart';
import 'package:talent_link/src/domain/entities/business_trip/country.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/business_trip/business_trip_bloc.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_controller.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_error_massage.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_functions.dart';
import 'package:talent_link/src/presentation/screens/business_trip/utils/business_trip_global_key.dart';
import 'package:talent_link/src/presentation/screens/business_trip/widgets/business_trip_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/city_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/country_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class BusinessTripScreen extends BaseStatefulWidget {
  const BusinessTripScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _BusinessTripScreenState();
}

class _BusinessTripScreenState extends BaseState<BusinessTripScreen> {
  BusinessTripBloc get _bloc => BlocProvider.of<BusinessTripBloc>(context);
  final BusinessErrorMassage _businessErrorMassage = BusinessErrorMassage();
  bool _isValidTripPurpose = true;
  bool _isValidRemarks = true;
  bool _fileIsMandatory = false;
  String _filePath = '';
  int _stepID = 1;
  bool _paymentVisible = false;
  bool _isSelectedVisaRequired = false;
  List<RequestType> _businessTripTypes = [];
  RequestType _businessTripType = RequestType(id: 0, name: '');
  List<RequestPaymentMethod> _paymentMethods = [];
  RequestPaymentMethod _paymentMethod = RequestPaymentMethod(id: 0, name: '');
  final _picker = ImagePicker();
  List<Country> _countries = [];
  Country _country = Country(countryId: 0, countryName: '');

  List<City> _cites = [];
  City _city = City(cityId: 0, cityName: '', countryId: 0);
  final BusinessTripGlobalKey _businessTripGlobalKey = BusinessTripGlobalKey(
    businessTripType: GlobalKey(),
    departureDate: GlobalKey(),
    returnDate: GlobalKey(),
    duration: GlobalKey(),
    expectedResumeDutyDate: GlobalKey(),
    paymentMethod: GlobalKey(),
    actualResumeDutyDate: GlobalKey(),
    tripPurpose: GlobalKey(),
    country: GlobalKey(),
    city: GlobalKey(),
    flightDate: GlobalKey(),
    visaAmount: GlobalKey(),
    ticketAmount: GlobalKey(),
    hotelAmount: GlobalKey(),
    perDiemAmount: GlobalKey(),
    remarks: GlobalKey(),
    file: GlobalKey(),
  );
  final BusinessTripController _businessTripController = BusinessTripController(
      businessTripType: TextEditingController(),
      duration: TextEditingController(),
      paymentMethod: TextEditingController(),
      tripPurpose: TextEditingController(),
      country: TextEditingController(),
      city: TextEditingController(),
      visaAmount: TextEditingController(),
      ticketAmount: TextEditingController(),
      hotelAmount: TextEditingController(),
      perDiemAmount: TextEditingController(),
      remarks: TextEditingController(),
      expensesName: TextEditingController(),
      expensesAmount: TextEditingController(),
      departureDate: TextEditingController(),
      returnDate: TextEditingController(),
      expectedResumeDutyDate: TextEditingController(),
      actualResumeDutyDate: TextEditingController(),
      flightDate: TextEditingController());

  @override
  void initState() {
    _businessTripTypes = _bloc.businessTripTypes;
    _paymentMethods = _bloc.paymentMethods;
    _countries = _bloc.countries;
    _cites = _bloc.cites;
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<BusinessTripBloc, BusinessTripState>(
        listener: (context, state) {
      if (state is BusinessTripLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is BusinessTripBackState) {
        Navigator.pop(context);
      } else if (state is BusinessTripOpenBusinessTripTypeBottomSheetState) {
        _openBusinessTripTypeBottomSheet();
      } else if (state is BusinessTripSelectBusinessTripTypeState) {
        _businessTripController.businessTripType.text = state.requestType.name;
      } else if (state is BusinessTripOpenPaymentMethodBottomSheetState) {
        _openPaymentMethodBottomSheet();
      } else if (state is BusinessTripSelectPaymentMethodState) {
        _businessTripController.paymentMethod.text = state.paymentMethod.name;
      } else if (state is BusinessTripValidationBusinessTripTypeEmptyState) {
        _businessErrorMassage.businessTripType = state.validationMassage;
        _animateTo(_businessTripGlobalKey.businessTripType);
      } else if (state is BusinessTripValidationBusinessTripTypeValidState) {
        _businessErrorMassage.businessTripType = null;
      } else if (state is BusinessTripValidationDepartureDateEmptyState) {
        _businessErrorMassage.departureDate = state.validationMassage;
        _animateTo(_businessTripGlobalKey.departureDate);
      } else if (state is BusinessTripValidationDepartureDateValidState) {
        _businessErrorMassage.departureDate = null;
      } else if (state is BusinessTripValidationReturnDateEmptyState) {
        _businessErrorMassage.returnDate = state.validationMassage;
        _animateTo(_businessTripGlobalKey.returnDate);
      } else if (state is BusinessTripValidationReturnDateValidState) {
        _businessErrorMassage.returnDate = null;
      } else if (state is BusinessTripValidationDurationEmptyState) {
        _businessErrorMassage.duration = state.validationMassage;
        _animateTo(_businessTripGlobalKey.duration);
      } else if (state is BusinessTripValidationDurationValidState) {
        _businessErrorMassage.duration = null;
      } else if (state
          is BusinessTripValidationExpectedResumeDutyDateEmptyState) {
        _businessErrorMassage.expectedResumeDutyDate = state.validationMassage;
        _animateTo(_businessTripGlobalKey.expectedResumeDutyDate);
      } else if (state
          is BusinessTripValidationExpectedResumeDutyDateValidState) {
        _businessErrorMassage.expectedResumeDutyDate = null;
      } else if (state is BusinessTripValidationPaymentMethodEmptyState) {
        _businessErrorMassage.paymentMethod = state.validationMassage;
        _animateTo(_businessTripGlobalKey.paymentMethod);
      } else if (state is BusinessTripValidationPaymentMethodValidState) {
        _businessErrorMassage.paymentMethod = null;
      } else if (state
          is BusinessTripValidationActualResumeDutyDateEmptyState) {
        _businessErrorMassage.actualResumeDutyDate = state.validationMassage;
        _animateTo(_businessTripGlobalKey.actualResumeDutyDate);
      } else if (state
          is BusinessTripValidationActualResumeDutyDateValidState) {
        _businessErrorMassage.actualResumeDutyDate = null;
      } else if (state is BusinessTripValidationTripPurposeEmptyState) {
        _businessErrorMassage.tripPurpose = state.validationMassage;
        _isValidTripPurpose = false;
        _animateTo(_businessTripGlobalKey.tripPurpose);
      } else if (state is BusinessTripValidationTripPurposeValidState) {
        _businessErrorMassage.tripPurpose = null;
        _isValidTripPurpose = true;
      } else if (state is BusinessTripValidationFirstStepSuccessState) {
        _stepID = 2;
      } else if (state is BusinessTripVisiblePaymentMethodState) {
        _paymentVisible = state.paymentMethodVisible;
        if (state.paymentMethodVisible == false) {
          _paymentMethod = RequestPaymentMethod(id: 0, name: '');
          _businessErrorMassage.paymentMethod = null;
          _businessTripController.paymentMethod.text = '';
        }
      } else if (state is BusinessTripOpenCountryBottomSheetState) {
        _openCountryBottomSheet();
      } else if (state is BusinessTripOpenCityBottomSheetState) {
        _openCityBottomSheet();
      } else if (state is BusinessTripOpenFileBottomSheetState) {
        _openFileBottomSheet();
      } else if (state is BusinessTripOpenCameraState) {
        _openCamera();
      } else if (state is BusinessTripOpenGalleryState) {
        _openGallery();
      } else if (state is BusinessTripOpenFileState) {
        _openFile();
      } else if (state is BusinessTripSelectFileState) {
        _filePath = state.filePath;
      } else if (state is BusinessTripDeleteFileState) {
        _filePath = state.filePath;
      } else if (state is BusinessTripSelectCountryState) {
        _businessTripController.country.text = state.country.countryName;
      } else if (state is BusinessTripSelectCityState) {
        _businessTripController.city.text = state.city.cityName;
      } else if (state is BusinessTripValidationCountryEmptyState) {
        _businessErrorMassage.country = state.validationMassage;
        _animateTo(_businessTripGlobalKey.country);
      } else if (state is BusinessTripValidationCountryValidState) {
        _businessErrorMassage.country = null;
      } else if (state is BusinessTripValidationCityEmptyState) {
        _businessErrorMassage.city = state.validationMassage;
        _animateTo(_businessTripGlobalKey.city);
      } else if (state is BusinessTripValidationCityValidState) {
        _businessErrorMassage.city = null;
      } else if (state is BusinessTripValidationFlightDateEmptyState) {
        _businessErrorMassage.flightDate = state.validationMassage;
        _animateTo(_businessTripGlobalKey.flightDate);
      } else if (state is BusinessTripValidationFlightDateValidState) {
        _businessErrorMassage.flightDate = null;
      } else if (state is BusinessTripValidationVisaAmountEmptyState) {
        _businessErrorMassage.visaAmount = state.validationMassage;
        _animateTo(_businessTripGlobalKey.visaAmount);
      } else if (state is BusinessTripValidationVisaAmountValidState) {
        _businessErrorMassage.visaAmount = null;
      } else if (state is BusinessTripValidationTicketAmountEmptyState) {
        _businessErrorMassage.ticketAmount = state.validationMassage;
        _animateTo(_businessTripGlobalKey.ticketAmount);
      } else if (state is BusinessTripValidationTicketAmountValidState) {
        _businessErrorMassage.ticketAmount = null;
      } else if (state is BusinessTripValidationHotelAmountEmptyState) {
        _businessErrorMassage.hotelAmount = state.validationMassage;
        _animateTo(_businessTripGlobalKey.hotelAmount);
      } else if (state is BusinessTripValidationHotelAmountValidState) {
        _businessErrorMassage.hotelAmount = null;
      } else if (state is BusinessTripValidationPerDiemAmountEmptyState) {
        _businessErrorMassage.perDiemAmount = state.validationMassage;
        _animateTo(_businessTripGlobalKey.perDiemAmount);
      } else if (state is BusinessTripValidationPerDiemAmountValidState) {
        _businessErrorMassage.perDiemAmount = null;
      } else if (state is BusinessTripValidationRemarksEmptyState) {
        _businessErrorMassage.remarks = state.validationMassage;
        _isValidRemarks = false;
        _animateTo(_businessTripGlobalKey.remarks);
      } else if (state is BusinessTripValidationRemarksValidState) {
        _businessErrorMassage.remarks = null;
        _isValidRemarks = true;
      } else if (state is BusinessTripValidationFileEmptyState) {
        _businessErrorMassage.file = state.validationMassage;
        _fileIsMandatory = true;
        _animateTo(_businessTripGlobalKey.file);
      } else if (state is BusinessTripValidationFileValidState) {
        _businessErrorMassage.file = null;
        _fileIsMandatory = false;
      } else if (state is BusinessTripStepState) {
        _stepID = state.stepId;
      } else if (state is BusinessTripVisaRequiredState) {
        _isSelectedVisaRequired = state.isSelectedVisaRequired;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: buildAppBarWidget(context,
            title: S.of(context).businessTrip,
            isHaveBackButton: true, onBackButtonPressed: () {
          _bloc.add(BusinessTripBackEvent());
        }),
        body: BusinessTripContentWidget(
          isSelectedVisaRequired: _isSelectedVisaRequired,
          paymentVisible: _paymentVisible,
          isValidRemarks: _isValidRemarks,
          stepID: _stepID,
          fileIsMandatory: _fileIsMandatory,
          filePath: _filePath,
          isValidTripPurpose: _isValidTripPurpose,
          businessErrorMassage: _businessErrorMassage,
          businessTripGlobalKey: _businessTripGlobalKey,
          businessTripController: _businessTripController,
          businessTripFunctions: BusinessTripFunctions(
            onTapBusinessTripType: () {
              _bloc.add(BusinessTripOpenBusinessTripTypeBottomSheetEvent());
            },
            onTapPaymentMethod: () {
              _bloc.add(BusinessTripOpenPaymentMethodBottomSheetEvent());
            },
            onPickDepartureDate: (String value) {
              _businessTripController.departureDate.text = value;
              _bloc.add(BusinessTripValidationDepartureDateEvent(value: value));
            },
            onPickReturnDate: (String value) {
              _businessTripController.returnDate.text = value;
              _bloc.add(BusinessTripValidationReturnDateEvent(value: value));
            },
            onPickActualResumeDutyDate: (String value) {
              _businessTripController.actualResumeDutyDate.text = value;
              _bloc.add(BusinessTripValidationActualResumeDutyDateEvent(
                  value: value));
            },
            onPickExpectedResumeDutyDate: (String value) {
              _businessTripController.expectedResumeDutyDate.text = value;
              _bloc.add(BusinessTripValidationExpectedResumeDutyDateEvent(
                  value: value));
            },
            onDeleteReturnDate: () {
              _bloc.add(BusinessTripValidationReturnDateEvent(value: ''));
            },
            onDeleteExpectedResumeDutyDate: () {
              _bloc.add(
                  BusinessTripValidationExpectedResumeDutyDateEvent(value: ''));
            },
            onDeleteDepartureDate: () {
              _bloc.add(BusinessTripValidationDepartureDateEvent(value: ''));
            },
            onDeleteActualResumeDutyDate: () {
              _bloc.add(
                  BusinessTripValidationActualResumeDutyDateEvent(value: ''));
            },
            onChangeDuration: (String value) {
              _bloc.add(BusinessTripValidationDurationEvent(value: value));
            },
            onSelectRadioButton: (SingleSelectionModel value) {
              _bloc.add(BusinessTripVisiblePaymentMethodEvent(
                  singleSelectionModel: value));
            },
            onChangeTripPurpose: (String value) {
              _bloc.add(BusinessTripValidationTripPurposeEvent(value: value));
            },
            onTapNext: () => _businessTripNextEvent(),
            onTapBusinessTripStep: () {
              _bloc.add(BusinessTripStepEvent(stepId: 1));
            },
            onTapCountry: () {
              _bloc.add(BusinessTripOpenCountryBottomSheetEvent());
            },
            onTapCity: () {
              _bloc.add(BusinessTripOpenCityBottomSheetEvent());
            },
            onPickFlightDate: (String value) {
              _businessTripController.flightDate.text = value;
              _bloc.add(BusinessTripValidationFlightDateEvent(value: value));
            },
            onDeleteFlightDate: () {
              _bloc.add(BusinessTripValidationFlightDateEvent(value: ''));
            },
            onChangeVisaAmount: (String value) {
              _bloc.add(BusinessTripValidationVisaAmountEvent(value: value));
            },
            onChangeTicketAmount: (String value) {
              _bloc.add(BusinessTripValidationTicketAmountEvent(value: value));
            },
            onChangeHotelAmount: (String value) {
              _bloc.add(BusinessTripValidationHotelAmountEvent(value: value));
            },
            onChangePerDiemAmount: (String value) {
              _bloc.add(BusinessTripValidationPerDiemAmountEvent(value: value));
            },
            onChangeRemarks: (String value) {
              _bloc.add(BusinessTripValidationRemarksEvent(value: value));
            },
            deleteFileAction: (String value) {
              _deleteFile(value);
            },
            onTapAdd: () {
              _bloc.add(BusinessTripAddEvent(
                  businessTripController: _businessTripController,
                  file: _filePath));
            },
            showUploadFileBottomSheet: () {
              _bloc.add(BusinessTripOpenFileBottomSheetEvent());
            },
            onTapDestinationStep: () => _businessTripNextEvent(),
            onTapVisaRequired: () {
              _bloc.add(BusinessTripVisaRequiredEvent(
                  isSelectedVisaRequired: _isSelectedVisaRequired));
            },
          ),
        ),
      );
    });
  }

  void _openBusinessTripTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _businessTripTypes,
        requestType: _businessTripType,
      ),
      titleLabel: S.of(context).businessTripType,
    ).then((value) {
      _businessTripType = value;
      _bloc.add(BusinessTripSelectBusinessTripTypeEvent(
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
      _bloc.add(BusinessTripSelectPaymentMethodEvent(
        paymentMethod: value,
        paymentVisible: _paymentVisible,
      ));
    });
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }

  void _businessTripNextEvent() {
    _bloc.add(BusinessTripNextEvent(
        businessTripController: _businessTripController,
        paymentVisible: _paymentVisible));
  }

  void _openCountryBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: CountryBottomSheetWidget(
        countries: _countries,
        country: _country,
      ),
      titleLabel: S.of(context).country,
    ).then((value) {
      _country = value;
      _bloc.add(BusinessTripSelectCountryEvent(
        country: value,
      ));
    });
  }

  void _openCityBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: CityBottomSheetWidget(
        cites: _cites,
        city: _city,
      ),
      titleLabel: S.of(context).city,
    ).then((value) {
      _city = value;
      _bloc.add(BusinessTripSelectCityEvent(
        city: value,
      ));
    });
  }

  void _openFileBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () => _bloc.add(BusinessTripOpenCameraEvent()),
        onTapGallery: () => _bloc.add(BusinessTripOpenGalleryEvent()),
        onTapFile: () => _bloc.add(BusinessTripOpenFileEvent()),
      ),
      titleLabel: S.of(context).choseFile,
    );
  }

  void _openCamera() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.camera).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(BusinessTripBackEvent());
          _bloc.add(BusinessTripSelectFileEvent(filePath: value.path));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(BusinessTripBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(BusinessTripBackEvent());
                  _bloc.add(BusinessTripSelectFileEvent(filePath: value.path));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(BusinessTripBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _openGallery() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(BusinessTripBackEvent());
          _bloc.add(BusinessTripSelectFileEvent(filePath: value.path));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(BusinessTripBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(BusinessTripBackEvent());
                  _bloc.add(BusinessTripSelectFileEvent(filePath: value.path));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(BusinessTripBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _openFile() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.storage,
    )) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        _bloc.add(BusinessTripBackEvent());
        _bloc.add(
            BusinessTripSelectFileEvent(filePath: result.files.single.path!));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(BusinessTripBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(BusinessTripBackEvent());
                _bloc.add(BusinessTripSelectFileEvent(
                    filePath: result.files.single.path!));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(BusinessTripBackEvent());
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

  void _deleteFile(String value) {
    _showActionDialog(
      onPrimaryAction: () {
        _bloc.add(BusinessTripBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(BusinessTripBackEvent());
        _bloc.add(BusinessTripDeleteFileEvent(filePath: value));
      },
      primaryText: S.of(context).no,
      secondaryText: S.of(context).yes,
      text: S.of(context).areYouSureYouWantToDeleteThisFile,
    );
  }
}
