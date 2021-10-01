import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/team_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailsCard extends StatelessWidget {
  MemberDetailModel memberdetails;
  MemberDetailsCard({required this.memberdetails});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.26,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
            child: Row(
              children: <Widget>[
                Image.asset(
                  memberdetails.assetImage,
                  width: 180,
                  height: 200,
                ),
                Spacer(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        memberdetails.name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        memberdetails.position,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(FontAwesomeIcons.githubSquare),
                            iconSize: 40,
                            onPressed: () {
                              _launchURLBrowser(memberdetails.githubUrl);
                            },
                          ),
                          SizedBox(
                            width: 20,
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
                    ]),
              ],
            ),
          )),
    );
  }
}

_launchURLBrowser(String url) async {
  await launch(url);
}
