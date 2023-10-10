import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';

part 'remote_payment_method.g.dart';

@JsonSerializable()
class RemotePaymentMethod{
  @JsonKey(name: 'paymentMethodId')
  final int id;
  @JsonKey(name: 'paymentMethodName')
  final String name;

  RemotePaymentMethod({this.name = '', this.id = 0});

  factory RemotePaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$RemotePaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePaymentMethodToJson(this);
}

extension RemotePaymentMethodExtension on RemotePaymentMethod {
  RequestPaymentMethod mapToDomain() {
    return RequestPaymentMethod(
      id: id,
      name: name,
    );
  }
}

extension RemotePaymentMethodListExtension on List<RemotePaymentMethod>? {
  List<RequestPaymentMethod> mapPaymentMethodToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
