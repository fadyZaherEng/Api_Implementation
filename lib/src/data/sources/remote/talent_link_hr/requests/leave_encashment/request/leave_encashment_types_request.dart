import 'package:json_annotation/json_annotation.dart';

part 'leave_encashment_types_request.g.dart';

@JsonSerializable()
class LeaveEncashmentTypeRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  LeaveEncashmentTypeRequest({this.employeeId = 2220});

  factory LeaveEncashmentTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveEncashmentTypeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveEncashmentTypeRequestToJson(this);
}
