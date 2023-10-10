import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_short_leave_types.g.dart';

@JsonSerializable()
class RemoteShortLeaveTypes {
  @JsonKey(name: 'shortLeaveTypeId')
  final int id;
  @JsonKey(name: 'shortLeaveTypeName')
  final String name;

  RemoteShortLeaveTypes({this.name = '', this.id = 0});

  factory RemoteShortLeaveTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteShortLeaveTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteShortLeaveTypesToJson(this);
}

extension RemoteShortLeaveTypesExtension on RemoteShortLeaveTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteShortLeaveTypesListExtension on List<RemoteShortLeaveTypes>? {
  List<RequestType> mapShortLeaveTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
