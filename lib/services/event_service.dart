import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mlsa_amu/models/events.dart';

class EventService {
  Future fetchEventDetails() async {
    QuerySnapshot query;
    List<EventsModel> eventsList = [];
    query = await FirebaseFirestore.instance.collection('event').orderBy('createdAt').get();
    query.docs.forEach((element) {
      EventsModel event = EventsModel.fromMap(element.data());
      eventsList.add(event);
    });

    return eventsList;
  }
}
