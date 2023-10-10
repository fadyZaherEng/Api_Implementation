class LeaveAlternativeEmployee {
  final int id;
  final String name;
  bool isSelected;

  LeaveAlternativeEmployee({
    required this.id,
    required this.name,
    this.isSelected = false,
  });
}
