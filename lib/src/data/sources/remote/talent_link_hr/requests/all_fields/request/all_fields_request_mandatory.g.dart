// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_fields_request_mandatory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFieldsMandatoryRequest _$AllFieldsMandatoryRequestFromJson(
        Map<String, dynamic> json) =>
    AllFieldsMandatoryRequest(
      requestTypeId: json['requestTypeId'] as int? ?? 1,
      requestData: json['requestData'] as int? ?? 1087,
    );

Map<String, dynamic> _$AllFieldsMandatoryRequestToJson(
        AllFieldsMandatoryRequest instance) =>
    <String, dynamic>{
      'requestTypeId': instance.requestTypeId,
      'requestData': instance.requestData,
    };
