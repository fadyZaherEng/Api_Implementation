import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponseContentWidget extends StatefulWidget {
  String asset;

  double value;

  String text;
  ResponseContentWidget({
    super.key,
    required this.asset,
    required this.value,
    required this.text,
  });

  @override
  State<ResponseContentWidget> createState() => _ResponseContentWidgetState();
}

class _ResponseContentWidgetState extends State<ResponseContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(56, 203, 137, 0.1),
              child: SvgPicture.asset(widget.asset),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(28, 22, 46, 1),
              ),
            ),
            const Spacer(),
            Text(
              "${widget.value} KWD",
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(28, 22, 46, 1),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 1,
        width: MediaQuery.sizeOf(context).width * 0.92,
        color: const Color.fromRGBO(217, 217, 217, 1),
      )
    ]);
  }
}
