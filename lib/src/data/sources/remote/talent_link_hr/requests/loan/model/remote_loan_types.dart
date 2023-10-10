import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_loan_types.g.dart';

@JsonSerializable()
class RemoteLoanTypes {
  @JsonKey(name: 'loanTypeId')
  final int id;
  @JsonKey(name: 'loanTypeName')
  final String name;

  RemoteLoanTypes({this.name = '', this.id = 0});

  factory RemoteLoanTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteLoanTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLoanTypesToJson(this);
}

extension RemoteLoanTypesExtension on RemoteLoanTypes {
  RequestType mapToDomain() {
    return RequestType(
      id: id,
      name: name,
    );
  }
}

extension RemoteLoanTypesListExtension on List<RemoteLoanTypes>? {
  List<RequestType> mapLoanTypesToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
