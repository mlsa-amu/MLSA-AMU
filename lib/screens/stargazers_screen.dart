import 'package:flutter/material.dart';
import 'package:mlsa_amu/api/api.dart';
import 'package:mlsa_amu/models/repo_details.dart';
import 'package:mlsa_amu/widgets/user_details_card.dart';

class StargazersScreen extends StatefulWidget {
  final String starUrl;
  const StargazersScreen(this.starUrl, {Key? key}) : super(key: key);

  @override
  _StargazersScreenState createState() => _StargazersScreenState();
}

class _StargazersScreenState extends State<StargazersScreen> {
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
      backgroundColor: Color(0XFF0B0B0D),
      appBar: AppBar(
        title: Text(
          "Stargazers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF17181C),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
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
