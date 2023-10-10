import 'package:json_annotation/json_annotation.dart';

part 'leave_types_request.g.dart';

@JsonSerializable()
class LeaveTypeRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  LeaveTypeRequest({this.employeeId = 2220});

  factory LeaveTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeRequestToJson(this);
}
