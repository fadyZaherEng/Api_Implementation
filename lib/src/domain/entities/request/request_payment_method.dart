class RequestPaymentMethod {
  final int id;
  final String name;
  bool isSelected;

  RequestPaymentMethod({
    required this.id,
    required this.name,
    this.isSelected = false,
  });
}
