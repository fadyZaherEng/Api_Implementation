import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';

part 'payslip_content.g.dart';

@JsonSerializable()
class PayslipContent {
  @JsonKey(name: 'salary')
  final double salary;
  @JsonKey(name: 'basicSalary')
  final double basicSalary;
  @JsonKey(name: 'hour')
  final double hour;
  @JsonKey(name: 'additions')
  final double additions;
  @JsonKey(name: 'decuted')
  final double decuted;

  PayslipContent({
    required this.salary,
    required this.basicSalary,
    required this.hour,
    required this.additions,
    required this.decuted,
  });

  factory PayslipContent.fromJson(Map<String, dynamic> json) =>
      _$PayslipContentFromJson(json);

  Map<String, dynamic> toJson() => _$PayslipContentToJson(this);
}

extension PayslipContentExtension on PayslipContent {
  PayslipModel mapToDomain() {
    return PayslipModel(
      salary: salary ?? 245000,
      basicSalary: basicSalary ?? 200,
      hour: hour ?? 20,
      additions: additions ?? 13,
      decuted: decuted ?? 4,
    );
  }
}
