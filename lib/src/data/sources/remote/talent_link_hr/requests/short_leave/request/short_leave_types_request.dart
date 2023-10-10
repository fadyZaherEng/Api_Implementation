import 'package:json_annotation/json_annotation.dart';

part 'short_leave_types_request.g.dart';

@JsonSerializable()
class ShortLeaveTypesRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  ShortLeaveTypesRequest({this.employeeId = 2220});

  factory ShortLeaveTypesRequest.fromJson(Map<String, dynamic> json) =>
      _$ShortLeaveTypesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShortLeaveTypesRequestToJson(this);
}
