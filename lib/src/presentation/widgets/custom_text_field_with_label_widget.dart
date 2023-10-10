import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_widget.dart';

class CustomTextFieldWithLabelWidget extends StatefulWidget {
  final String title;
  final String? errorMassage;
  final GlobalKey globalKey;
  final TextEditingController controller;
  final String label;
  final void Function(String value) onChange;

  const CustomTextFieldWithLabelWidget({
    Key? key,
    required this.title,
    this.errorMassage,
    required this.globalKey,
    this.label = '',
    required this.onChange,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFieldWithLabelWidget> createState() =>
      _CustomTextFieldWithLabelWidgetState();
}

class _CustomTextFieldWithLabelWidgetState
    extends State<CustomTextFieldWithLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.globalKey,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorSchemes.sameBlack),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              child: CustomTextFieldWidget(
                  inputFormatters: [],
                  controller: widget.controller,
                  labelTitle: widget.label,
                  onChange: (value) => widget.onChange(value),
                  textInputType: TextInputType.text,
                  errorMessage: widget.errorMassage),
            ),
          ],
        ),
      ],
    );
  }
}
