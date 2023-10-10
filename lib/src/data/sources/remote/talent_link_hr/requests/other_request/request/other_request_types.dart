import 'package:json_annotation/json_annotation.dart';

part 'other_request_types.g.dart';

@JsonSerializable()
class OtherRequestTypes {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  OtherRequestTypes({this.employeeId = 2220});

  factory OtherRequestTypes.fromJson(Map<String, dynamic> json) =>
      _$OtherRequestTypesFromJson(json);

  Map<String, dynamic> toJson() => _$OtherRequestTypesToJson(this);
}
