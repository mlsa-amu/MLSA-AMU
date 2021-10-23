import 'package:cloud_firestore/cloud_firestore.dart';

class EventsModel {
  String? image;
  String? title;
  String? subTitle;
  String? about;
  DateTime? startDate;
  DateTime? endDate;
  List? winners;
  List? organizers;
  List? sponsors;

  EventsModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.about,
    required this.winners,
    required this.organizers,
    required this.sponsors,
    required this.startDate,
    required this.endDate,
  });
  Map toMap(EventsModel event) {
    Map<String, dynamic> teamMap = Map<String, dynamic>();
    teamMap['title'] = event.title;
    teamMap['subtitle'] = event.subTitle;
    teamMap['about'] = event.about;
    teamMap['image'] = event.image;
    teamMap['winners'] = event.winners;
    teamMap['organizers'] = event.organizers;
    teamMap['sponsors'] = event.sponsors;
    teamMap['startDate'] = Timestamp.fromMicrosecondsSinceEpoch(startDate!.microsecondsSinceEpoch);
    teamMap['endDate'] = Timestamp.fromMicrosecondsSinceEpoch(endDate!.microsecondsSinceEpoch);
    return teamMap;
  }

  EventsModel.fromMap(doc) {
    Timestamp time;
    title = doc['title'];
    subTitle = doc['subtitle'];
    about = doc['about'];
    image = doc['image'];
    winners = doc['winners'];
    organizers = doc['organizers'];
    sponsors = doc['sponsors'];
    time = doc['startDate'];
    startDate =
        DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
    time = doc['endDate'];
    endDate = DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
  }
}
