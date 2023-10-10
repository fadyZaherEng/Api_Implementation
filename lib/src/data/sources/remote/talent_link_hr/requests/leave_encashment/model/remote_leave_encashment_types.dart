import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_leave_encashment_types.g.dart';

@JsonSerializable()
class RemoteLeaveEncashmentTypes {
  @JsonKey(name: 'leaveEncashmentTypeId')
  final int id;
  @JsonKey(name: 'leaveEncashmentTypeName')
  final String name;

  RemoteLeaveEncashmentTypes({this.name = '', this.id = 0});

  factory RemoteLeaveEncashmentTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteLeaveEncashmentTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLeaveEncashmentTypesToJson(this);
}

extension RemoteLeaveEncashemntTypeExtension on RemoteLeaveEncashmentTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteLeaveEncashmentTypesListExtension on List<RemoteLeaveEncashmentTypes>? {
  List<RequestType> mapLeaveTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
