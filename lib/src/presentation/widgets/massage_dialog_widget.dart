import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';

class MassageDialogWidget extends StatelessWidget {
  final String text;
  final String icon;
  final String buttonText;
  final Function() onTap;

  const MassageDialogWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.buttonText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorSchemes.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 16.2),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorSchemes.black, letterSpacing: -0.24),
          ),
          const SizedBox(height: 32.0),
          CustomGradientButtonWidget(text: buttonText, onTap: onTap)
        ],
      ),
    ));
  }
}
