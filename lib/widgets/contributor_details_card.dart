import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';

class ContributorDetailsCard extends StatelessWidget {
  final MemberDetailModel memberdetails;
  ContributorDetailsCard({required this.memberdetails});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(radius: 40,
        backgroundColor: Colors.white,
        backgroundImage:
            AssetImage(memberdetails.assetImage),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(memberdetails.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      subtitle: Text('Count of PRs', style: TextStyle(color: Colors.white)),
    );
  }
}
