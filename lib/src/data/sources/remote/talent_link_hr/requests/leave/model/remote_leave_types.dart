import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_leave_types.g.dart';

@JsonSerializable()
class RemoteLeaveTypes {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  RemoteLeaveTypes({this.name = '', this.id = 0});

  factory RemoteLeaveTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteLeaveTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLeaveTypesToJson(this);
}

extension RemoteLeaveTypeExtension on RemoteLeaveTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteLeaveTypesListExtension on List<RemoteLeaveTypes>? {
  List<RequestType> mapLeaveTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
