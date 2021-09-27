import 'package:flutter/material.dart';

import '../utils.dart';

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
                padding: EdgeInsets.fromLTRB(0, Utils.height * 0.05, 0, 0),
                child: Container(
                  height: Utils.height * 0.25,
                  width: Utils.width,
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
                      horizontal: Utils.width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            sideItemsIcon[index],
                            color: Colors.white,
                          ),
                          label: Text(
                            sideItems[index],
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.w600,
                              fontSize: Utils.width * 0.05,
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
