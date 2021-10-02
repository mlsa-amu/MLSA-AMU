import 'package:flutter/material.dart';
import 'package:mlsa_amu/Utils/size_config.dart';
import 'package:mlsa_amu/screens/contact_screen.dart';
import 'package:mlsa_amu/screens/contributors_screen.dart';
import 'package:mlsa_amu/screens/events_screen.dart';
import 'package:mlsa_amu/screens/gallery_screen.dart';
import 'package:mlsa_amu/screens/home_page.dart';
import 'package:mlsa_amu/screens/team_screen.dart';

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
                Colors.blue.shade900,
                Colors.white,
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
                      image: NetworkImage(
                        'https://res.cloudinary.com/vidita/image/upload/v1625389955/logo_kayvjr.png',
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
                        TextButton.icon(
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
                          icon: Icon(
                            sideItemsIcon[index],
                            color: Colors.white,
                          ),
                          label: Text(
                            sideItems[index],
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.baseFontSize * 5,
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: Colors.blue.shade900,
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
