import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/contributor_details_card.dart';
import 'package:mlsa_amu/widgets/member_details_card.dart';

class ContributorsScreen extends StatelessWidget {
  const ContributorsScreen({Key? key}) : super(key: key);

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
            'Contributors',
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
              ListView.separated(
                separatorBuilder: (_, __) => SizedBox(
                  height: 5,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: memberDetails.length,
                itemBuilder: (context, index) {
                  return ContributorDetailsCard(
                      memberdetails: memberDetails[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
