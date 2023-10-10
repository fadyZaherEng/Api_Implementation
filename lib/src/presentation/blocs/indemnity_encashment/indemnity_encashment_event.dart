part of 'indemnity_encashment_bloc.dart';

@immutable
abstract class IndemnityEncashmentEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class IndemnityEncashmentBackEvent extends IndemnityEncashmentEvent {}

class IndemnityEncashmentOpenPaymentMethodBottomSheetEvent
    extends IndemnityEncashmentEvent {}

class IndemnityEncashmentValidationRemarksEvent
    extends IndemnityEncashmentEvent {
  final String value;

  final bool isMandatory;

  IndemnityEncashmentValidationRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentDeleteFileEvent extends IndemnityEncashmentEvent {
  final String value;
  final bool isMandatory;

  IndemnityEncashmentDeleteFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenUploadFileEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenUploadFileEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentValidationRequestedDaysEvent
    extends IndemnityEncashmentEvent {
  final String value;

  IndemnityEncashmentValidationRequestedDaysEvent({
    required this.value,
  });
}

class IndemnityEncashmentValidationPaymentMonthEvent
    extends IndemnityEncashmentEvent {
  final String value;

  IndemnityEncashmentValidationPaymentMonthEvent({
    required this.value,
  });
}
class IndemnityEncashmentValidationPaymentMethodEvent
    extends IndemnityEncashmentEvent {
  final String value;

  IndemnityEncashmentValidationPaymentMethodEvent({
    required this.value,
  });
}

class IndemnityEncashmentValidationRequestedDateEvent
    extends IndemnityEncashmentEvent {
  final String value;

  IndemnityEncashmentValidationRequestedDateEvent({
    required this.value,
  });
}



class IndemnityEncashmentSelectFileEvent extends IndemnityEncashmentEvent {
  final String value;
  final bool isMandatory;

  IndemnityEncashmentSelectFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentSelectPaymentMethodEvent
    extends IndemnityEncashmentEvent {
  final RequestPaymentMethod value;

  IndemnityEncashmentSelectPaymentMethodEvent({
    required this.value,
  });
}

class IndemnityEncashmentOpenCameraEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenCameraEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenGalleryEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenGalleryEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenFileEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenFileEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentSubmitEvent extends IndemnityEncashmentEvent {
  final String requestedDate;
  final String paymentMonth;
  final List<IndemnityEncashment> indemnitiesEncashment;
  final String file;
  final IndemnityEncashmentController indemnityEncashmentController;

  IndemnityEncashmentSubmitEvent({
    required this.indemnityEncashmentController,
    required this.paymentMonth,
    required this.requestedDate,
    required this.indemnitiesEncashment,
    required this.file,
  });
}

class IndemnityEncashmentValidationFileEvent
    extends IndemnityEncashmentEvent {
  final String value;
  final bool isMandatory;

  IndemnityEncashmentValidationFileEvent({
    required this.value,
    required this.isMandatory,
  });
}



class IndemnityEncashmentGetPaymentMethodEvent extends IndemnityEncashmentEvent {}
