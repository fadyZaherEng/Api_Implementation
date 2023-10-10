import 'package:json_annotation/json_annotation.dart';

part 'all_fields_request_mandatory.g.dart';

@JsonSerializable()
class AllFieldsMandatoryRequest {
  @JsonKey(name: 'requestTypeId')
  final int requestTypeId;
  @JsonKey(name: 'requestData')
  final int requestData;

  AllFieldsMandatoryRequest({this.requestTypeId = 1,this.requestData =1087});

  factory AllFieldsMandatoryRequest.fromJson(Map<String, dynamic> json) =>
      _$AllFieldsMandatoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AllFieldsMandatoryRequestToJson(this);
}
