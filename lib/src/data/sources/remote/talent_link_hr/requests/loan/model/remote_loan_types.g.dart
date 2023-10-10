// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_loan_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLoanTypes _$RemoteLoanTypesFromJson(Map<String, dynamic> json) =>
    RemoteLoanTypes(
      name: json['loanTypeName'] as String? ?? '',
      id: json['loanTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteLoanTypesToJson(RemoteLoanTypes instance) =>
    <String, dynamic>{
      'loanTypeId': instance.id,
      'loanTypeName': instance.name,
    };
