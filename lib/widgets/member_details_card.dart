import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailsCard extends StatelessWidget {
  MemberDetailModel memberdetails;
  MemberDetailsCard({required this.memberdetails});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: height * 0.26,
        width: width * 0.9,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
          child: Row(
            children: <Widget>[
              Image.asset(
                memberdetails.assetImage,
                width: width * 0.4583,
                height: height * 0.249,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, width * 0.012, 0, width * 0.006),
                    child: Text(
                      memberdetails.name,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.1),
                    child: Text(
                      memberdetails.position,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, width * 0.051, 0),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.githubSquare),
                          iconSize: 40,
                          onPressed: () {
                            _launchURLBrowser(memberdetails.githubUrl);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.linkedin),
                        color: Colors.blue[700],
                        iconSize: 40,
                        onPressed: () {
                          _launchURLBrowser(memberdetails.linkedinUrl);
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
