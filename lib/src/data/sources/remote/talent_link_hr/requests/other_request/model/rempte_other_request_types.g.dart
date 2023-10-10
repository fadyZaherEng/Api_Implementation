// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rempte_other_request_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOtherRequestTypes _$RemoteOtherRequestTypesFromJson(
        Map<String, dynamic> json) =>
    RemoteOtherRequestTypes(
      name: json['otherRequestTypeName'] as String? ?? '',
      id: json['otherRequestTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteOtherRequestTypesToJson(
        RemoteOtherRequestTypes instance) =>
    <String, dynamic>{
      'otherRequestTypeId': instance.id,
      'otherRequestTypeName': instance.name,
    };
