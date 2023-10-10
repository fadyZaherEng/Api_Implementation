// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_alternative_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAlternativeEmployee _$RemoteAlternativeEmployeeFromJson(
        Map<String, dynamic> json) =>
    RemoteAlternativeEmployee(
      name: json['alternativeEmployeeName'] as String? ?? '',
      id: json['alternativeEmployeeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteAlternativeEmployeeToJson(
        RemoteAlternativeEmployee instance) =>
    <String, dynamic>{
      'alternativeEmployeeId': instance.id,
      'alternativeEmployeeName': instance.name,
    };
