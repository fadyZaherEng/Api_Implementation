part of 'indemnity_encashment_bloc.dart';

@immutable
abstract class IndemnityEncashmentState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class IndemnityEncashmentInitialState extends IndemnityEncashmentState {}

class IndemnityEncashmentLoadingState extends IndemnityEncashmentState {}

class IndemnityEncashmentBackState extends IndemnityEncashmentState {}

class IndemnityEncashmentOpenPaymentMethodBottomSheetState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationRemarksEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationRemarksEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationRemarksValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationFileEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationFileEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationFileValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentDeleteFileState extends IndemnityEncashmentState {
  final String value;

  IndemnityEncashmentDeleteFileState({
    required this.value,
  });
}

class IndemnityEncashmentOpenUploadFileState extends IndemnityEncashmentState {
  final bool isMandatory;

  IndemnityEncashmentOpenUploadFileState({
    required this.isMandatory,
  });
}

class IndemnityEncashmentValidationRequestedDaysEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationRequestedDaysEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationRequestedDaysNotValidState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationRequestedDaysNotValidState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationRequestedDaysValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationPaymentMonthEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationPaymentMonthEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationPaymentMonthValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationPaymentMethodEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationPaymentMethodEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationPaymentMethodValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationRequestedDateEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationRequestedDateEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationRequestedDateValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationDeletePaymentMonthEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationDeletePaymentMonthEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationDeletePaymentMonthValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentValidationDeleteRequestedDateEmptyState
    extends IndemnityEncashmentState {
  final String validationMassage;

  IndemnityEncashmentValidationDeleteRequestedDateEmptyState({
    required this.validationMassage,
  });
}

class IndemnityEncashmentValidationDeleteRequestedDateValidState
    extends IndemnityEncashmentState {}

class IndemnityEncashmentSelectFileState extends IndemnityEncashmentState {
  final String value;

  IndemnityEncashmentSelectFileState({
    required this.value,
  });
}

class IndemnityEncashmentSelectPaymentMethodState
    extends IndemnityEncashmentState {
  final RequestPaymentMethod value;

  IndemnityEncashmentSelectPaymentMethodState({
    required this.value,
  });
}

class IndemnityEncashmentOpenCameraState extends IndemnityEncashmentState {
  final bool isMandatory;

  IndemnityEncashmentOpenCameraState({
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenGalleryState extends IndemnityEncashmentState {
  final bool isMandatory;

  IndemnityEncashmentOpenGalleryState({
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenFileState extends IndemnityEncashmentState {
  final bool isMandatory;

  IndemnityEncashmentOpenFileState({
    required this.isMandatory,
  });
}

class IndemnityEncashmentSubmitSuccessState extends IndemnityEncashmentState {
  final String successMassage;

  IndemnityEncashmentSubmitSuccessState({
    required this.successMassage,
  });
}

class IndemnityEncashmentGetPaymentMethodSuccessState extends IndemnityEncashmentState {
  final List<RequestPaymentMethod> paymentMethods;

  IndemnityEncashmentGetPaymentMethodSuccessState({
    required this.paymentMethods,
  });
}

class IndemnityEncashmentGetPaymentMethodErrorState extends IndemnityEncashmentState {
  final String errorMassage;

  IndemnityEncashmentGetPaymentMethodErrorState({
    required this.errorMassage,
  });
}
