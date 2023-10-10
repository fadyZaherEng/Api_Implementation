// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_resume_duty_reference_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteResumeDutyReferenceData _$RemoteResumeDutyReferenceDataFromJson(
        Map<String, dynamic> json) =>
    RemoteResumeDutyReferenceData(
      name: json['referenceDataName'] as String? ?? '',
      id: json['referenceDataId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteResumeDutyReferenceDataToJson(
        RemoteResumeDutyReferenceData instance) =>
    <String, dynamic>{
      'referenceDataId': instance.id,
      'referenceDataName': instance.name,
    };
