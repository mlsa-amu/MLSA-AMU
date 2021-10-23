import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';
import 'package:mlsa_amu/services/service.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/member_details_card.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<MemberDetailModel> membersList = [];
  @override
  void initState() {
    super.initState();
    Service().fetchTeamDetails().then((value) async {
      setState(() {
        membersList = value;
      });
    });
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
        appBar: AppBar(
          toolbarHeight: SizeConfig.appBarHeight,
          title: Text(
            'Team',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: membersList.length,
                itemBuilder: (context, index) {
                  return MemberDetailsCard(memberdetails: membersList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
