import 'package:flutter/material.dart';
import 'package:mlsa_amu/api/api.dart';
import 'package:mlsa_amu/models/contributors.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributorsScreen extends StatefulWidget {
  const ContributorsScreen({Key? key}) : super(key: key);

  @override
  _ContributorsScreenState createState() => _ContributorsScreenState();
}

class _ContributorsScreenState extends State<ContributorsScreen> {
  List<ContributorsModel> contributorsList = [];
  @override
  void initState() {
    API().fetchContributors().then((value) {
      if (value != null) {
        value.forEach((item) {
          ContributorsModel contributorsModel =
              ContributorsModel.fromJson(item);
          contributorsList.add(contributorsModel);
        });
      }
      print(contributorsList);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            "Contributors",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: contributorsList.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: contributorsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 4,
                      vertical: SizeConfig.safeBlockVertical * 1,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            await launch(contributorsList[index].githubUrl!);
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage(contributorsList[index].image!),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.safeBlockVertical * 0.5),
                                child: Text(
                                  contributorsList[index].contributorName!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.baseFontSize * 4,
                                  ),
                                ),
                              ),
                              Text(
                                "Contributions: " +
                                    contributorsList[index]
                                        .contributions
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.baseFontSize * 3,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
