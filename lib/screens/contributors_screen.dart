import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlsa_amu/api/api.dart';
import 'package:mlsa_amu/models/repo_details.dart';
import 'package:mlsa_amu/screens/starred_user_screen.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/user_details_card.dart';

class ContributorsScreen extends StatefulWidget {
  const ContributorsScreen({Key? key}) : super(key: key);

  @override
  _ContributorsScreenState createState() => _ContributorsScreenState();
}

class _ContributorsScreenState extends State<ContributorsScreen> {
  RepoDetailsModel repoDetails = RepoDetailsModel();
  @override
  void initState() {
    API().fetchRepoDetails().then((value) {
      if (value != null) {
        repoDetails = RepoDetailsModel.fromJson(value);
        API().fetchUsersDetails(repoDetails.contributorsUrl!).then((value) {
          if (value != null) {
            value.forEach((item) {
              UserDetails contributorsModel = UserDetails.fromJson(item);
              API().fetchUsersDetails(contributorsModel.apiUrl!).then((value) {
                if (value != null) {
                  contributorsModel.bio = value['bio'];
                  repoDetails.contributorsList!.add(contributorsModel);
                }
                setState(() {});
              });
            });
          }
          setState(() {});
        });
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF17181C),
      body: repoDetails.contributorsList == null
          ? Container()
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/mlsa-logo.png",
                          height: SizeConfig.iconGeneralHeightAndWidth,
                          width: SizeConfig.iconGeneralHeightAndWidth,
                        ),
                        SizedBox(width: 5),
                        Text(
                          repoDetails.repoName!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.baseFontSize * 7,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 2,
                      ),
                      child: Text(
                        repoDetails.repoDescription!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: SizeConfig.baseFontSize * 4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 2,
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StarredUserScreen(repoDetails.starUrl!),
                                ),
                              );
                            },
                            child: getHeaderView(
                              FontAwesomeIcons.star,
                              repoDetails.stars!,
                              "stars",
                              iconColor: Colors.yellow,
                            ),
                          ),
                          getHeaderView(
                            FontAwesomeIcons.codeBranch,
                            repoDetails.forks!,
                            "forks",
                          ),
                          getHeaderView(
                            FontAwesomeIcons.dotCircle,
                            repoDetails.openIssues!,
                            "issues",
                            iconColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 40,
                    ),
                    Text(
                      "Contributors",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.baseFontSize * 5.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.separated(
                      separatorBuilder: (_, __) => SizedBox(
                        height: 30,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: repoDetails.contributorsList!.length,
                      itemBuilder: (context, index) {
                        return UserDetailsCard(
                          repoDetails.contributorsList![index],
                        );
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }

  Widget getHeaderView(
    IconData iconData,
    int data,
    String dataText, {
    Color iconColor = Colors.grey,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 0.6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: SizeConfig.iconGeneralHeightAndWidth * 0.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 2,
            ),
            child: Text(
              data.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.baseFontSize * 4.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.safeBlockHorizontal * 2.5,
            ),
            child: Text(
              dataText,
              style: TextStyle(
                color: Colors.grey,
                fontSize: SizeConfig.baseFontSize * 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
