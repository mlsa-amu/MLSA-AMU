import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/contributors.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributorDetailsCard extends StatelessWidget {
  final ContributorsModel contributorsModel;
  ContributorDetailsCard(this.contributorsModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: InkWell(
        onTap: () async {
          await launch(contributorsModel.githubUrl!);
        },
        child: CircleAvatar(
          radius: SizeConfig.iconGeneralHeightAndWidth,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(contributorsModel.contributorsImage!),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(
          bottom: SizeConfig.safeBlockVertical * 0.6,
        ),
        child: Text(
          contributorsModel.contributorName!,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.baseFontSize * 4,
          ),
        ),
      ),
      subtitle: Text(
        "Contributions: " + contributorsModel.contributions.toString(),
        style: TextStyle(
          color: Colors.grey,
          fontSize: SizeConfig.baseFontSize * 3.6,
        ),
      ),
    );
  }
}
