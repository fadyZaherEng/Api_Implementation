import 'package:json_annotation/json_annotation.dart';

part 'payment_method_request.g.dart';

@JsonSerializable()
class PaymentMethodRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  PaymentMethodRequest({this.employeeId = 2220});

  factory PaymentMethodRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodRequestToJson(this);
}
