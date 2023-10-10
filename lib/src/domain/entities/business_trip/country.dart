class Country {
  final int countryId;
  final String countryName;
  bool isSelected;

  Country(
      {required this.countryId,
      required this.countryName,
      this.isSelected = false});
}
