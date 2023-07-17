import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class TicketBooking extends StatefulWidget {
  const TicketBooking({super.key});

  @override
  State<TicketBooking> createState() => _TicketBookingState();
}

class _TicketBookingState extends State<TicketBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: const Center(
        child: Text("Ticket"),
      ),
    );
  }
}
