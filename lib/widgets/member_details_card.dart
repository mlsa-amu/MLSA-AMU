import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailsCard extends StatelessWidget {
  final MemberDetailModel memberdetails;
  MemberDetailsCard({required this.memberdetails});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
        vertical: SizeConfig.safeBlockHorizontal * 2.5,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: SizeConfig.screenHeight / 6,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.network(
                  memberdetails.assetImage!,
                  fit: BoxFit.fill,
                  width: SizeConfig.screenWidth / 3,
                  height: SizeConfig.screenHeight / 6,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        memberdetails.name!,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: SizeConfig.baseFontSize * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical * 0.5,
                        ),
                        child: Text(
                          memberdetails.position!,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: SizeConfig.baseFontSize * 3.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: SizeConfig.safeBlockHorizontal * 8,
                        ),
                        child: InkWell(
                          child: Icon(
                            FontAwesomeIcons.githubSquare,
                            size: SizeConfig.iconGeneralHeightAndWidth * 1.3,
                          ),
                          onTap: () {
                            _launchURLBrowser(memberdetails.githubUrl!);
                          },
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.blue[700],
                          size: SizeConfig.iconGeneralHeightAndWidth * 1.3,
                        ),
                        onTap: () {
                          _launchURLBrowser(memberdetails.linkedinUrl!);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURLBrowser(String url) async {
  await launch(url);
}
