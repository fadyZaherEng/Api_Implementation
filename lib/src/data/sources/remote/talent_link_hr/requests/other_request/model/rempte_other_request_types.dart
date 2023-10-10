import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'rempte_other_request_types.g.dart';

@JsonSerializable()
class RemoteOtherRequestTypes {
  @JsonKey(name: 'otherRequestTypeId')
  final int id;
  @JsonKey(name: 'otherRequestTypeName')
  final String name;

  RemoteOtherRequestTypes({this.name = '', this.id = 0});

  factory RemoteOtherRequestTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteOtherRequestTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOtherRequestTypesToJson(this);
}

extension RemoteOtherRequestTypesExtension on RemoteOtherRequestTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteOtherRequestTypesListExtension
    on List<RemoteOtherRequestTypes>? {
  List<RequestType> mapOtherRequestTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
