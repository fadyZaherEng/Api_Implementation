class City {
  final int cityId;
  final String cityName;
  final int countryId;
  bool isSelected;

  City({
    required this.cityId,
    required this.cityName,
    required this.countryId,
    this.isSelected = false,
  });
}
