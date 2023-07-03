import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class CustomClock extends StatefulWidget {
  const CustomClock({super.key});

  @override
  State<StatefulWidget> createState() => _CustomClockState();
}

class _CustomClockState extends State<CustomClock> {
  late DateTime currentDateTime;

  @override
  void initState() {
    super.initState();
    currentDateTime = DateTime.now();

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        currentDateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('EEEE, dd MMMM yyyy').format(currentDateTime),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          DateFormat("HH:mm").format(currentDateTime),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
