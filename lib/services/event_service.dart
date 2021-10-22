import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mlsa_amu/models/events.dart';

class EventService {
  Future fetchEventDetails() async {
    QuerySnapshot query;
    List<Events> eventsList = [];
    query = await FirebaseFirestore.instance.collection('event').get();
    query.docs.forEach((element) {
      Events event = Events.fromMap(element.data());
      eventsList.add(event);
    });

    return eventsList;
  }
}
