import 'package:json_annotation/json_annotation.dart';

part 'remote_validate_month_year.g.dart';

@JsonSerializable()
class RemoteValidateMonthYear {
  @JsonKey(name: 'isValid')
  final bool? isValid;
  @JsonKey(name: 'message')
  final dynamic message;
  @JsonKey(name: 'salaryMonth')
  final dynamic salaryMonth;
  @JsonKey(name: 'salaryYear')
  final dynamic salaryYear;

  RemoteValidateMonthYear({
    this.isValid,
    this.message,
    this.salaryYear,
    this.salaryMonth,
  });

  factory RemoteValidateMonthYear.fromJson(Map<String, dynamic> json) =>
      _$RemoteValidateMonthYearFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteValidateMonthYearToJson(this);
}
