import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_half_day_types.g.dart';

@JsonSerializable()
class RemoteHalfDayTypes {
  @JsonKey(name: 'halfDayLeaveTypeId')
  final int id;
  @JsonKey(name: 'halfDayLeaveTypeName')
  final String name;

  RemoteHalfDayTypes({this.name = '', this.id = 0});

  factory RemoteHalfDayTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteHalfDayTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteHalfDayTypesToJson(this);
}

extension RemoteHalfDayTypesExtension on RemoteHalfDayTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteHalfDayTypesListExtension on List<RemoteHalfDayTypes>? {
  List<RequestType> mapHalfDayTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
