import 'package:flutter/material.dart';
import 'package:mlsa_amu/api/api.dart';
import 'package:mlsa_amu/models/repo_details.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/user_details_card.dart';

class StarredUserScreen extends StatefulWidget {
  final String starUrl;
  const StarredUserScreen(this.starUrl, {Key? key}) : super(key: key);

  @override
  _StarredUserScreenState createState() => _StarredUserScreenState();
}

class _StarredUserScreenState extends State<StarredUserScreen> {
  List<UserDetails> usersDetailList = [];

  @override
  void initState() {
    fetchStargazers();
    super.initState();
  }

  fetchStargazers() {
    API().fetchUsersDetails(widget.starUrl).then((value) {
      if (value != null) {
        value.forEach((item) {
          UserDetails userDetails = UserDetails.fromMap(item);
          API().fetchUsersDetails(userDetails.apiUrl!).then((value) {
            if (value != null) {
              userDetails.bio = value['bio'];
              userDetails.fullName = value['name'];
              usersDetailList.add(userDetails);
            }
            setState(() {});
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF17181C),
      appBar: AppBar(
        title: Text(
          "Stargazers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20),
            ListView.separated(
              separatorBuilder: (_, __) => SizedBox(
                height: 35,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: usersDetailList.length,
              itemBuilder: (context, index) {
                return UserDetailsCard(
                  usersDetailList[index],
                  isContributionsShow: false,
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
