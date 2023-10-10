import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/widgets/custom_check_box_widget.dart';

class CheckboxWidget extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
   final String? title;

  const CheckboxWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
     this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomCheckBoxWidget(
            isSelected: isSelected,
          ),
          const SizedBox(width: 16),
          Text(title??S.of(context).byCurrentBalance,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ColorSchemes.gray,
                  )),
        ],
      ),
    );
  }
}
