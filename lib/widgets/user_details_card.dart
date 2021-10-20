import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/repo_details.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsCard extends StatelessWidget {
  final UserDetails contributorsModel;
  final bool isContributionsShow;
  UserDetailsCard(
    this.contributorsModel, {
    this.isContributionsShow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            await launch(contributorsModel.githubUrl!);
          },
          child: CircleAvatar(
            radius: SizeConfig.iconGeneralHeightAndWidth * 0.7,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(contributorsModel.userImage!),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible:
                    !isContributionsShow && contributorsModel.fullName != null,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.safeBlockVertical * 0.4,
                  ),
                  child: Text(
                    contributorsModel.fullName ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.baseFontSize * 4,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockVertical * 0.4,
                ),
                child: Text(
                  contributorsModel.userName!,
                  style: TextStyle(
                    color: isContributionsShow ? Colors.white : Colors.grey,
                    fontSize: SizeConfig.baseFontSize * 4,
                  ),
                ),
              ),
              Visibility(
                visible: isContributionsShow,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.safeBlockVertical * 0.8,
                  ),
                  child: Text(
                    "Contributions: " +
                        contributorsModel.contributions.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: SizeConfig.baseFontSize * 3.6,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: contributorsModel.bio != null,
                child: Text(
                  contributorsModel.bio ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.baseFontSize * 3.6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
