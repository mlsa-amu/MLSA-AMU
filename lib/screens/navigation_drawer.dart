import 'package:flutter/material.dart';
import 'package:mlsa_amu/screens/contact_screen.dart';
import 'package:mlsa_amu/screens/contributors_screen.dart';
import 'package:mlsa_amu/screens/events_screen.dart';
import 'package:mlsa_amu/screens/gallery_screen.dart';
import 'package:mlsa_amu/screens/home_page.dart';
import 'package:mlsa_amu/screens/team_screen.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<String> sideItems = [
    'Home',
    'Events',
    'Gallery',
    'Team',
    'Contributors',
    'Contact Us'
  ];
  List<Widget> navigateTo = [
    HomePage(),
    EventsScreen(),
    GalleryScreen(),
    TeamScreen(),
    ContributorsScreen(),
    ContactScreen(),
  ];
  List sideItemsIcon = [
    Icons.home,
    Icons.event,
    Icons.image,
    Icons.people,
    Icons.people_alt_outlined,
    Icons.phone
  ];
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0XFF17181C),
                Color(0XFF0B0B0D),
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 6,
                ),
                child: Container(
                  height: SizeConfig.screenHeight * 0.25,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/mlsa-logo.png',
                      ),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: sideItems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (sideItems[index] != "Home") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => navigateTo[index],
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.all(SizeConfig.kDefaultPadding),
                                child: Icon(
                                  sideItemsIcon[index],
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.all(SizeConfig.kDefaultPadding),
                                child: Text(
                                  sideItems[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.baseFontSize * 4.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: Colors.white,
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
