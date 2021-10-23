import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlsa_amu/services/service.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);

  final TextEditingController feedbackController = TextEditingController();
  final String github = "https://github.com/mlsa-amu";
  final String email = "Paste Email Here"; // TODO: Add Email Address
  final String linkedIn = "Paste LinkedIn URL Here"; // TODO : Add Linkedin URL

  //Launch URL Function
  Future<void> _launchUrl(String url) async {
    //final encodedUrl = Uri.encodeFull(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig.initOnStartUp(context); //SizeConfig Initiation
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "Contact Us",
            style: TextStyle(
              fontSize: SizeConfig.baseFontSize * 6.5,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Image.asset(
                  'assets/images/mlsa-logo.png',
                  height: SizeConfig.screenHeight * 0.35,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Reach Out to Us",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: SizeConfig.baseFontSize * 5.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              _launchUrl(github);
                            },
                            iconSize: SizeConfig.screenWidth * 0.15,
                            icon: Icon(FontAwesomeIcons.github),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.07,
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUrl("mailto:" + email);
                            },
                            iconSize: SizeConfig.screenWidth * 0.15,
                            icon: Image.asset("assets/images/gmail.png"),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.07,
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUrl(linkedIn);
                            },
                            iconSize: SizeConfig.screenWidth * 0.15,
                            icon: Icon(FontAwesomeIcons.linkedin),
                            color: Colors.blue[900],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your Feedback",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: SizeConfig.baseFontSize * 5.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: SizeConfig.screenHeight * 0.15,
                              child: TextField(
                                controller: feedbackController,
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  hintText: 'Feedback...',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Service()
                                  .submitFeedback(feedbackController.text)
                                  .then(
                                (value) {
                                  _launchUrl(
                                    "mailto:" +
                                        email +
                                        "?subject=Feedback&body=" +
                                        feedbackController.toString(),
                                  ).then(
                                    (value) => feedbackController.clear(),
                                  );
                                },
                              );
                            }, // TODO: Need Fix for Submit Method
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                              ),
                              backgroundColor: Colors.cyan,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.baseFontSize * 4.5,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
