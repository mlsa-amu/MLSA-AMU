import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/services/service.dart';
import 'package:mlsa_amu/widgets/event_card.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<EventsModel> eventsList = [];

  @override
  void initState() {
    super.initState();
    Service().fetchEventDetails().then(
      (value) async {
        setState(
          () {
            eventsList = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            "Events",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: eventsList.length,
          itemBuilder: (BuildContext context, int index) {
            return EventCard(eventsList[index]);
          },
        ),
      ),
    );
  }
}
