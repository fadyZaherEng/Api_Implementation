// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePaymentMethod _$RemotePaymentMethodFromJson(Map<String, dynamic> json) =>
    RemotePaymentMethod(
      name: json['paymentMethodName'] as String? ?? '',
      id: json['paymentMethodId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemotePaymentMethodToJson(
        RemotePaymentMethod instance) =>
    <String, dynamic>{
      'paymentMethodId': instance.id,
      'paymentMethodName': instance.name,
    };
