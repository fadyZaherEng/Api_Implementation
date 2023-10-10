import 'package:json_annotation/json_annotation.dart';

part 'resume_duty_reference_data_request.g.dart';

@JsonSerializable()
class ResumeDutyReferenceDataRequest {
  @JsonKey(name: 'EmployeeId')
  final int employeeId;
  @JsonKey(name: 'ResumeDutyReferenceType')
  final int resumeDutyReferenceType;
  @JsonKey(name: 'IsByPayroll')
  final int isByPayroll;

  ResumeDutyReferenceDataRequest({
    this.employeeId = 2220,
    required this.resumeDutyReferenceType,
    required this.isByPayroll,
  });

  factory ResumeDutyReferenceDataRequest.fromJson(Map<String, dynamic> json) =>
      _$ResumeDutyReferenceDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeDutyReferenceDataRequestToJson(this);
}
