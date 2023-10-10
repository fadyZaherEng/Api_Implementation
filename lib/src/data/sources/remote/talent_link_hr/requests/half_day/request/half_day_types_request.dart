import 'package:json_annotation/json_annotation.dart';

part 'half_day_types_request.g.dart';

@JsonSerializable()
class HalfDayTypesRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;

  HalfDayTypesRequest({this.employeeId = 2220});

  factory HalfDayTypesRequest.fromJson(Map<String, dynamic> json) =>
      _$HalfDayTypesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HalfDayTypesRequestToJson(this);
}
