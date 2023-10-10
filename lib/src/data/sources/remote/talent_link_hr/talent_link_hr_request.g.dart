// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talent_link_hr_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TalentLinkHrRequest<T> _$TalentLinkHrRequestFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TalentLinkHrRequest<T>(
      userId: json['userId'] as int?,
      subscriberId: json['subscriberId'] as int?,
      companyId: json['companyId'] as int?,
      langId: json['langId'] as String?,
      deviceTypeCode: json['deviceTypeCode'] as int?,
      deviceToken: json['deviceToken'] as String?,
      deviceSerial: json['deviceSerial'] as String?,
      appVersion: json['appVersion'] as String?,
      oSVersion: json['oSVersion'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$TalentLinkHrRequestToJson<T>(
  TalentLinkHrRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'userId': instance.userId,
      'subscriberId': instance.subscriberId,
      'companyId': instance.companyId,
      'langId': instance.langId,
      'deviceTypeCode': instance.deviceTypeCode,
      'deviceToken': instance.deviceToken,
      'deviceSerial': instance.deviceSerial,
      'appVersion': instance.appVersion,
      'oSVersion': instance.oSVersion,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
