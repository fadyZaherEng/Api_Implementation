class RequestType {
  final int id;
  final String name;
  bool isSelected;

  RequestType({
    required this.id,
    required this.name,
    this.isSelected = false,
  });
}
