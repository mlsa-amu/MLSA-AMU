import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlsa_amu/api/api.dart';
import 'package:mlsa_amu/models/repo_details.dart';
import 'package:mlsa_amu/screens/starred_user_screen.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/contributors_header.dart';
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
      appBar: AppBar(
        title: Text(
          "Contributors",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF0B0B0D),
        elevation: 0,
      ),
      body: repoDetails.contributorsList == null
          ? Container()
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0XFF0B0B0D),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 4,
                      horizontal: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                                      builder: (context) => StarredUserScreen(
                                          repoDetails.starUrl!),
                                    ),
                                  );
                                },
                                child: ContributorsHeader(
                                  FontAwesomeIcons.star,
                                  repoDetails.stars!,
                                  "stars",
                                  iconColor: Colors.yellow,
                                ),
                              ),
                              ContributorsHeader(
                                FontAwesomeIcons.codeBranch,
                                repoDetails.forks!,
                                "forks",
                              ),
                              ContributorsHeader(
                                FontAwesomeIcons.dotCircle,
                                repoDetails.openIssues!,
                                "issues",
                                iconColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 2,
                      left: SizeConfig.safeBlockHorizontal * 4,
                      right: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    child: Text(
                      "Contributors",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.baseFontSize * 5.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  repoDetails.contributorsList!.length == 0
                      ? Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(
                            height: 30,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 4,
                            horizontal: SizeConfig.safeBlockHorizontal * 4,
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
    );
  }
}
