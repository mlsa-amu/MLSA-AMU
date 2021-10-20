import 'package:flutter/material.dart';

class ContributorsScreen extends StatelessWidget {
  const ContributorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF219653), Color(0xFF792ADC)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Contributors'),
        ),
        body: Center(
          child: Text(
            "Contributors Screen\nNeed to be done",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
