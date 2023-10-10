import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';

class RequestCardItemWidget extends StatelessWidget {
  final Request request;
  final Function() onTapItem;

  const RequestCardItemWidget({
    super.key,
    required this.request,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
        decoration: BoxDecoration(
            color: ColorSchemes.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 24,
                spreadRadius: 0,
                color: Color.fromRGBO(23, 43, 77, 0.16),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Opacity(
                    opacity: 0.16,
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _hexToColor(
                          request.imageColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: SvgPicture.asset(
                      request.imagePath,
                      matchTextDirection: true,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  request.text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorSchemes.sameBlack),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll('#','');
    int? hexValue = int.tryParse(hexColor, radix: 16);
    if (hexValue != null) {
      return Color(hexValue);
    } else {
      return Colors.black;
    }
  }
}
