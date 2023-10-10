

import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_alternative_employee.g.dart';

@JsonSerializable()
class RemoteAlternativeEmployee {
  @JsonKey(name: 'alternativeEmployeeId')
  final int id;
  @JsonKey(name: 'alternativeEmployeeName')
  final String name;

  RemoteAlternativeEmployee({this.name = '', this.id = 0});

  factory RemoteAlternativeEmployee.fromJson(Map<String, dynamic> json) =>
      _$RemoteAlternativeEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAlternativeEmployeeToJson(this);
}

extension RemoteAlternativeEmployeeExtension on RemoteAlternativeEmployee {
  LeaveAlternativeEmployee mapToDomain() {
    return LeaveAlternativeEmployee(
      id: id,
      name: name,
    );
  }
}

extension RemoteAlternativeEmployeeListExtension on List<RemoteAlternativeEmployee>? {
  List<LeaveAlternativeEmployee> mapAlternativeEmployeeToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
