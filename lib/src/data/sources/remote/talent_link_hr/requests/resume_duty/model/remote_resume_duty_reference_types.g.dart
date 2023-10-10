// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_resume_duty_reference_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteResumeDutyReferenceTypes _$RemoteResumeDutyReferenceTypesFromJson(
        Map<String, dynamic> json) =>
    RemoteResumeDutyReferenceTypes(
      name: json['referenceTypeName'] as String? ?? '',
      id: json['referenceTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteResumeDutyReferenceTypesToJson(
        RemoteResumeDutyReferenceTypes instance) =>
    <String, dynamic>{
      'referenceTypeId': instance.id,
      'referenceTypeName': instance.name,
    };
