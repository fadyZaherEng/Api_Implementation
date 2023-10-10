import 'package:json_annotation/json_annotation.dart';

part 'loan_types_request.g.dart';

@JsonSerializable()
class LoanTypesRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  LoanTypesRequest({this.employeeId = 2220});

  factory LoanTypesRequest.fromJson(Map<String, dynamic> json) =>
      _$LoanTypesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoanTypesRequestToJson(this);
}
