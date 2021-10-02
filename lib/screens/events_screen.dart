import 'dart:math';

import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue.shade900,
            Color(0XFF792adc),
            Color(0XFF792adc),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Events",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/mlsa-logo.png",
                height: min(width * 0.14, height * 0.070),
                width: min(width * 0.14, height * 0.070),
              ),
            )
          ],
        ),
        body: Center(
          child: Text(
            "Events Screen\nNeed to be done",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
