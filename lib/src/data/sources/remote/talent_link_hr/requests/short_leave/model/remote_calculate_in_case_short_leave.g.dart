// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_calculate_in_case_short_leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCalculateInCaseShortLeave _$RemoteCalculateInCaseShortLeaveFromJson(
        Map<String, dynamic> json) =>
    RemoteCalculateInCaseShortLeave(
      status: json['status'] as bool?,
      currentBalance: json['currentBalance'] as int?,
      remainingBalance: json['remainingBalance'] as int?,
      message: json['message'] as String?,
      validateCollideDates: json['validateCollideDates'],
    );

Map<String, dynamic> _$RemoteCalculateInCaseShortLeaveToJson(
        RemoteCalculateInCaseShortLeave instance) =>
    <String, dynamic>{
      'status': instance.status,
      'currentBalance': instance.currentBalance,
      'remainingBalance': instance.remainingBalance,
      'message': instance.message,
      'validateCollideDates': instance.validateCollideDates,
    };
