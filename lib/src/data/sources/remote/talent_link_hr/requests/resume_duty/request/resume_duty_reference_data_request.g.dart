// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_duty_reference_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeDutyReferenceDataRequest _$ResumeDutyReferenceDataRequestFromJson(
        Map<String, dynamic> json) =>
    ResumeDutyReferenceDataRequest(
      employeeId: json['EmployeeId'] as int? ?? 2220,
      resumeDutyReferenceType: json['ResumeDutyReferenceType'] as int,
      isByPayroll: json['IsByPayroll'] as int,
    );

Map<String, dynamic> _$ResumeDutyReferenceDataRequestToJson(
        ResumeDutyReferenceDataRequest instance) =>
    <String, dynamic>{
      'EmployeeId': instance.employeeId,
      'ResumeDutyReferenceType': instance.resumeDutyReferenceType,
      'IsByPayroll': instance.isByPayroll,
    };
