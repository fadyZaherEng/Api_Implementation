import 'package:json_annotation/json_annotation.dart';

part 'resume_duty_reference_types_request.g.dart';

@JsonSerializable()
class ResumeDutyReferenceTypesRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  ResumeDutyReferenceTypesRequest({this.employeeId = 2220});

  factory ResumeDutyReferenceTypesRequest.fromJson(Map<String, dynamic> json) =>
      _$ResumeDutyReferenceTypesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeDutyReferenceTypesRequestToJson(this);
}
