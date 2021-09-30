import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
            child: Row(
              children: [
                Text(
                  "Events",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/mlsa-logo.png",
                  height: 50,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF219653), Color(0xFF792ADC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Events Screen\nNeed to be done",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
