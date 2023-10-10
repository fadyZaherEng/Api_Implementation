import 'package:flutter/material.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';

class AirTicketTableWidget extends StatelessWidget {
  final List<AirTicket> airTickets;
  const AirTicketTableWidget({super.key,required this.airTickets});

  @override
  Widget build(BuildContext context) {


    return Padding(
        padding: const EdgeInsets.all(16),
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
            child: Table(
              columnWidths: const {
                0: FractionColumnWidth(0.1),
                1: FractionColumnWidth(0.3),
                2: FractionColumnWidth(0.3),
                3: FractionColumnWidth(0.3),
              },
              border: TableBorder.symmetric(
                  inside: const BorderSide(
                width: 2,
                color: ColorSchemes.borderColor,
              )),
              children: [
                for (int i = 0; i < airTickets.length; i++)
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(airTickets[i].id,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        i == 0 ? Colors.black : Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          airTickets[i].dependent,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: i == 0 ? Colors.black : Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          airTickets[i].ticketAmount,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: i == 0 ? Colors.black : Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          airTickets[i].destination,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: i == 0 ? Colors.black : Colors.grey),
                        ),
                      ),
                    ],
                  ),
              ],
            )));
  }
}
