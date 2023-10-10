import 'package:json_annotation/json_annotation.dart';


part 'talent_link_hr_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TalentLinkResponse<T> {
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'requestId')
  String? requestId;
  @JsonKey(name: 'error')
  List<String>? error;
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'responseMessage')
  String? responseMessage;
  @JsonKey(name: 'result')
  T? result;

  TalentLinkResponse({
    this.statusCode,
    this.requestId,
    this.error,
    this.success,
    this.responseMessage,
    this.result,
  });


  factory TalentLinkResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$TalentLinkResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$TalentLinkResponseToJson(this, (T t) {
        return t;
      });
}