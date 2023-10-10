class SingleSelectionModel {
  final int id;
  final String text;
  bool isSelected;

  SingleSelectionModel({
    required this.id,
    required this.text,
    this.isSelected = false,
  });
}
