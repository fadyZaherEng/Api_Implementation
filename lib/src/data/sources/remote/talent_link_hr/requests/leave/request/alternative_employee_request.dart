import 'package:json_annotation/json_annotation.dart';

part 'alternative_employee_request.g.dart';

@JsonSerializable()
class AlternativeEmployeeRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  AlternativeEmployeeRequest({this.employeeId = 2220});

  factory AlternativeEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$AlternativeEmployeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativeEmployeeRequestToJson(this);
}
