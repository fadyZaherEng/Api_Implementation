import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_resume_duty_reference_types.g.dart';

@JsonSerializable()
class RemoteResumeDutyReferenceTypes {
  @JsonKey(name: 'referenceTypeId')
  final int id;
  @JsonKey(name: 'referenceTypeName')
  final String name;

  RemoteResumeDutyReferenceTypes({this.name = '', this.id = 0});

  factory RemoteResumeDutyReferenceTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteResumeDutyReferenceTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteResumeDutyReferenceTypesToJson(this);
}

extension RemoteResumeDutyReferenceTypesExtension on RemoteResumeDutyReferenceTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteResumeDutyReferenceTypesListExtension on List<RemoteResumeDutyReferenceTypes>? {
  List<RequestType> mapResumeDutyReferenceTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
