import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/business_trip/city.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';

class CityBottomSheetWidget extends StatefulWidget {
  final List<City> cites;
  final City city;

  const CityBottomSheetWidget({
    super.key,
    required this.cites,
    required this.city,
  });

  @override
  State<CityBottomSheetWidget> createState() => _CityBottomSheetWidgetState();
}

class _CityBottomSheetWidgetState extends State<CityBottomSheetWidget> {
  City _city = City(cityId: 0, cityName: '', countryId: 0);

  @override
  void initState() {
    _city = widget.city;
    for (var element in widget.cites) {
      if (_city.cityId == element.cityId) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cites.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _onTap(widget.cites[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRadioButtonWidget(
                              isSelected: widget.cites[index].isSelected,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              widget.cites[index].cityName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: ColorSchemes.sameBlack,
                                  ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                              Divider(color: ColorSchemes.sameBlack, height: 1),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        CustomGradientButtonWidget(
            text: S.of(context).done, onTap: () => _onTapDone()),
        const SizedBox(height: 10),
      ],
    );
  }

  void _onTap(City city) {
    for (var element in widget.cites) {
      setState(() {
        if (element.cityId == city.cityId) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    }
  }

  void _onTapDone() {
    for (var element in widget.cites) {
      if (element.isSelected == true) {
        _city = element;
      }
    }
    Navigator.pop(context, _city);
  }
}
