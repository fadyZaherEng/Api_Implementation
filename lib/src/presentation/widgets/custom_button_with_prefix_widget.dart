import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';

class CustomButtonWithPrefixWidget extends StatefulWidget {
  final void Function() onTap;
  final String buttonTitle;
  final double height;
  final double? width;
  final bool? isSelected;

  const CustomButtonWithPrefixWidget({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    this.height = 34,
    this.width,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<CustomButtonWithPrefixWidget> createState() =>
      _CustomButtonWithPrefixWidgetState();
}

class _CustomButtonWithPrefixWidgetState
    extends State<CustomButtonWithPrefixWidget> {
  Color _borderWithTitleColor = ColorSchemes.gray;

  @override
  void didUpdateWidget(covariant CustomButtonWithPrefixWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.isSelected == true
        ? _borderWithTitleColor = ColorSchemes.black
        : _borderWithTitleColor = ColorSchemes.gray;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
          _checkButtonIsSelected();
        },
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isSelected == true
                        ? _borderWithTitleColor = ColorSchemes.primary
                        : _borderWithTitleColor = ColorSchemes.gray),
                color: ColorSchemes.white,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      widget.buttonTitle,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: _borderWithTitleColor,
                          fontSize: 13,
                          letterSpacing: -0.13),
                    ),
                    widget.isSelected!
                        ? const SizedBox(
                            width: 12,
                          )
                        : const SizedBox.shrink(),
                    Visibility(
                      visible: widget.isSelected!,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: ColorSchemes.primary,
                                borderRadius: BorderRadius.circular(40)),
                            child: SvgPicture.asset(
                              ImagePaths.approve,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _checkButtonIsSelected() {
    setState(() {
      if (widget.isSelected!) {
        _borderWithTitleColor = ColorSchemes.primary;
      } else {
        _borderWithTitleColor = ColorSchemes.gray;
      }
    });
  }
}
