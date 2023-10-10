import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/leave/leave_alternative_employee.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';

class LeaveAlternativeEmployeeBottomSheetWidget extends StatefulWidget {
  final List<LeaveAlternativeEmployee> leaveAlternativeEmployees;
  final LeaveAlternativeEmployee leaveAlternativeEmployee;

  const LeaveAlternativeEmployeeBottomSheetWidget({
    super.key,
    required this.leaveAlternativeEmployees,
    required this.leaveAlternativeEmployee,
  });

  @override
  State<LeaveAlternativeEmployeeBottomSheetWidget> createState() =>
      _LeaveAlternativeEmployeeBottomSheetWidgetState();
}

class _LeaveAlternativeEmployeeBottomSheetWidgetState
    extends State<LeaveAlternativeEmployeeBottomSheetWidget> {
  LeaveAlternativeEmployee _leaveAlternativeEmployee =
      LeaveAlternativeEmployee(id: 0, name: '');

  @override
  void initState() {
    _leaveAlternativeEmployee = widget.leaveAlternativeEmployee;
    for (var element in widget.leaveAlternativeEmployees) {
      if (_leaveAlternativeEmployee.id == element.id) {
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
              itemCount: widget.leaveAlternativeEmployees.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _onTap(widget.leaveAlternativeEmployees[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRadioButtonWidget(
                              isSelected: widget
                                  .leaveAlternativeEmployees[index].isSelected,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              widget.leaveAlternativeEmployees[index].name,
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

  void _onTap(LeaveAlternativeEmployee leaveAlternativeEmployee) {
    for (var element in widget.leaveAlternativeEmployees) {
      setState(() {
        if (element.id == leaveAlternativeEmployee.id) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    }
  }

  void _onTapDone() {
    for (var element in widget.leaveAlternativeEmployees) {
      if (element.isSelected == true) {
        _leaveAlternativeEmployee = element;
      }
    }
    Navigator.pop(
      context,
      _leaveAlternativeEmployee,
    );
  }
}
