import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';
import 'package:mlsa_amu/widgets/member_details_card.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF4D1892),
              Color(0xFF1774CA),
            ],
            stops: [
              0.3,
              0.8
            ]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              minimum: EdgeInsets.only(top: 90),
              child: ListView.builder(
                  itemCount: memberDetails.length,
                  itemBuilder: (context, index) {
                    return MemberDetailsCard(
                        memberdetails: memberDetails[index]);
                  }))),
    );
  }
}
