import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_resume_duty_reference_data.g.dart';

@JsonSerializable()
class RemoteResumeDutyReferenceData {
  @JsonKey(name: 'referenceDataId')
  final int id;
  @JsonKey(name: 'referenceDataName')
  final String name;

  RemoteResumeDutyReferenceData({this.name = '', this.id = 0});

  factory RemoteResumeDutyReferenceData.fromJson(Map<String, dynamic> json) =>
      _$RemoteResumeDutyReferenceDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteResumeDutyReferenceDataToJson(this);
}

extension RemoteResumeDutyReferenceDataExtension on RemoteResumeDutyReferenceData {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteResumeDutyReferenceDataListExtension
    on List<RemoteResumeDutyReferenceData>? {
  List<RequestType> mapResumeDutyReferenceDataToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
