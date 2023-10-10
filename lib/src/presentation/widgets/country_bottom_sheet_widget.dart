import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/business_trip/country.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';

class CountryBottomSheetWidget extends StatefulWidget {
  final List<Country> countries;
  final Country country;

  const CountryBottomSheetWidget({
    super.key,
    required this.countries,
    required this.country,
  });

  @override
  State<CountryBottomSheetWidget> createState() =>
      _CountryBottomSheetWidgetState();
}

class _CountryBottomSheetWidgetState extends State<CountryBottomSheetWidget> {
  Country _country = Country(countryId: 0, countryName: '');

  @override
  void initState() {
    _country = widget.country;
    for (var element in widget.countries) {
      if (_country.countryId == element.countryId) {
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
              itemCount: widget.countries.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _onTap(widget.countries[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRadioButtonWidget(
                              isSelected: widget.countries[index].isSelected,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              widget.countries[index].countryName,
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

  void _onTap(Country country) {
    for (var element in widget.countries) {
      setState(() {
        if (element.countryId == country.countryId) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    }
  }

  void _onTapDone() {
    for (var element in widget.countries) {
      if (element.isSelected == true) {
        _country = element;
      }
    }
    Navigator.pop(context, _country);
  }
}
