import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final TextEditingController feedbackController = TextEditingController();
  final String github = "https://github.com/mlsa-amu";
  final String email = "mlsaamu1@gmail.com";
  final String linkedIn = "https://www.linkedin.com/company/mlsa-amu";

  _launchURLBrowser(String url) async {
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF17181C),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Contact Us",
          style: TextStyle(
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
                height: SizeConfig.screenHeight * 0.25,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 4,
                ),
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
                            fontSize: SizeConfig.baseFontSize * 5,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            _launchURLBrowser(github);
                          },
                          iconSize: SizeConfig.iconGeneralHeightAndWidth * 1.6,
                          icon: Icon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURLBrowser("mailto:" + email);
                          },
                          iconSize: SizeConfig.iconGeneralHeightAndWidth * 1.6,
                          icon: Image.asset("assets/images/gmail.png"),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURLBrowser(linkedIn);
                          },
                          iconSize: SizeConfig.iconGeneralHeightAndWidth * 1.6,
                          icon: Icon(FontAwesomeIcons.linkedin),
                          color: Colors.blue[600],
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
                  horizontal: SizeConfig.safeBlockHorizontal * 4,
                ),
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
                            fontSize: SizeConfig.baseFontSize * 5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
                    Container(
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
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            _launchURLBrowser(
                              "mailto:" +
                                  email +
                                  "?subject=Feedback&body=" +
                                  feedbackController.text.toString(),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 6,
                            ),
                            backgroundColor: Colors.blue[400],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.baseFontSize * 4,
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
    );
  }
}
