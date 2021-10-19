import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mlsa_amu/models/team_details.dart';

class TeamService {
  Future fetchTeamDetails() async {
    QuerySnapshot query;
    List<MemberDetailModel> membersList = [];
    query = await FirebaseFirestore.instance.collection('team').get();
    query.docs.forEach((element) {
      MemberDetailModel member =  MemberDetailModel.fromMap(element.data());
      membersList.add(member);
    });

    return membersList;
  }
}
