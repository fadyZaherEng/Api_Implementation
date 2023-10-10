import 'package:json_annotation/json_annotation.dart';

part 'payslip_request.g.dart';

@JsonSerializable()
class PayslipRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'month')
  final int month;
  @JsonKey(name: 'year')
  final int year;

  PayslipRequest({this.employeeId = 2220, this.month = 7, this.year = 2023});

  factory PayslipRequest.fromJson(Map<String, dynamic> json) =>
      _$PayslipRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayslipRequestToJson(this);
}
