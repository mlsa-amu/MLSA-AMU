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
        colors: [
          Color.fromARGB(240, 33, 150, 83),
          Color.fromARGB(240, 121, 42, 220)
        ],
      )),
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
