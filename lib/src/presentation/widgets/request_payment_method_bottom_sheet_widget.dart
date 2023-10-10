import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';

class RequestPaymentMethodBottomSheetWidget extends StatefulWidget {
  final List<RequestPaymentMethod> paymentMethods;
  final RequestPaymentMethod paymentMethod;

  const RequestPaymentMethodBottomSheetWidget({
    super.key,
    required this.paymentMethods,
    required this.paymentMethod,
  });

  @override
  State<RequestPaymentMethodBottomSheetWidget> createState() =>
      _RequestPaymentMethodBottomSheetWidgetState();
}

class _RequestPaymentMethodBottomSheetWidgetState
    extends State<RequestPaymentMethodBottomSheetWidget> {
  RequestPaymentMethod _leavePaymentMethod = RequestPaymentMethod(id: 0, name: '');

  @override
  void initState() {
    _leavePaymentMethod = widget.paymentMethod;
    for (var element in widget.paymentMethods) {
      if (_leavePaymentMethod.id == element.id) {
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
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.paymentMethods.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _onTap(widget.paymentMethods[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRadioButtonWidget(
                              isSelected:
                                  widget.paymentMethods[index].isSelected,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              widget.paymentMethods[index].name,
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
        CustomGradientButtonWidget(text: S.of(context).done, onTap: () => _onTapDone()),
        const SizedBox(height: 10),
      ],
    );
  }

  void _onTap(RequestPaymentMethod leavePaymentMethod) {
    for (var element in widget.paymentMethods) {
      setState(() {
        if (element.id == leavePaymentMethod.id) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    }
  }

  void _onTapDone() {
    for (var element in widget.paymentMethods) {
      if (element.isSelected == true) {
        _leavePaymentMethod = element;
      }
    }
    Navigator.pop(
      context,
      _leavePaymentMethod,
    );
  }
}
