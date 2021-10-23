import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/models/team_details.dart';

class Service {
  Future fetchEventDetails() async {
    QuerySnapshot query;
    List<EventsModel> eventsList = [];
    query = await FirebaseFirestore.instance
        .collection('event')
        .orderBy('createdAt')
        .get();
    query.docs.forEach(
      (element) {
        EventsModel event = EventsModel.fromMap(element.data());
        eventsList.add(event);
      },
    );

    return eventsList;
  }

  Future submitFeedback(String feedbackContent) async {
    FirebaseFirestore.instance.collection('feedback').add(
      {
        'feedbackContent': feedbackContent,
      },
    );
  }

  Future fetchTeamDetails() async {
    QuerySnapshot query;
    List<MemberDetailModel> membersList = [];
    query = await FirebaseFirestore.instance.collection('team').get();
    query.docs.forEach(
      (element) {
        MemberDetailModel member = MemberDetailModel.fromMap(element.data());
        membersList.add(member);
      },
    );

    return membersList;
  }

  Future addDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection('users')
        .where('deviceToken', isEqualTo: token)
        .get()
        .then(
      (value) async {
        if (value.size == 0) {
          await FirebaseFirestore.instance.collection('users').add(
            {
              'deviceToken': token,
            },
          );
        }
      },
    );
  }
}
