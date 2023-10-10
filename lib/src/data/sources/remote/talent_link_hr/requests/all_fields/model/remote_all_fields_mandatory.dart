import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';

part 'remote_all_fields_mandatory.g.dart';

@JsonSerializable()
class RemoteAllFieldsMandatory {
  @JsonKey(name: 'fieldKey')
  final String fieldKey;
  @JsonKey(name: 'isRequired')
  final bool isRequired;
  @JsonKey(name: 'isHidden')
  final bool isHidden;

  RemoteAllFieldsMandatory(
      {this.fieldKey = '', this.isRequired = false, this.isHidden = false});

  factory RemoteAllFieldsMandatory.fromJson(Map<String, dynamic> json) =>
      _$RemoteAllFieldsMandatoryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAllFieldsMandatoryToJson(this);
}

extension RemoteAllFieldsMandatoryExtension on RemoteAllFieldsMandatory {
  AllFieldsMandatory mapToDomain() {
    return AllFieldsMandatory(
      fieldKey: fieldKey,
      isHidden: isHidden,
      isRequired: isRequired,
    );
  }
}

extension RemoteAllFieldsMandatoryListExtension on List<RemoteAllFieldsMandatory>? {
  List<AllFieldsMandatory> mapAllFieldsMandatoryToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
