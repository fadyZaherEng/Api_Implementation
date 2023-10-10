// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_all_fields_mandatory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAllFieldsMandatory _$RemoteAllFieldsMandatoryFromJson(
        Map<String, dynamic> json) =>
    RemoteAllFieldsMandatory(
      fieldKey: json['fieldKey'] as String? ?? '',
      isRequired: json['isRequired'] as bool? ?? false,
      isHidden: json['isHidden'] as bool? ?? false,
    );

Map<String, dynamic> _$RemoteAllFieldsMandatoryToJson(
        RemoteAllFieldsMandatory instance) =>
    <String, dynamic>{
      'fieldKey': instance.fieldKey,
      'isRequired': instance.isRequired,
      'isHidden': instance.isHidden,
    };
