import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/event_details.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class EventDetailsPage extends StatefulWidget {
  int index;
  EventDetailsPage({required this.index});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  bool isExpanded1 = false, isExpanded2 = false, isExpanded3 = false;
  final GlobalKey expansionTileKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424368),
      body: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.523,
            margin: EdgeInsets.fromLTRB(0, SizeConfig.safeBlockVertical * 2.3,
                0, SizeConfig.safeBlockVertical * 2.5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: SizeConfig.screenHeight * 0.56,
                    width: SizeConfig.screenWidth,
                    child: Image.asset(
                      "assets/images/${eventsImages[widget.index].image}",
                      fit: BoxFit.fill,
                      width: SizeConfig.screenWidth,
                    ),
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.safeBlockVertical * 2,
                  left: SizeConfig.safeBlockHorizontal * 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventsImages[widget.index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.baseFontSize * 5.2,
                        ),
                      ),
                      Text(
                        eventsImages[widget.index].subTitle,
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
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 4.2,
                0, 0, SizeConfig.safeBlockHorizontal * 6.6),
            child: Text(
              "23rd July 2021 - 25th July 2021",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.baseFontSize * 5,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    "Organizers",
                    style: TextStyle(
                      fontSize: SizeConfig.baseFontSize * 5,
                    ),
                  ),
                  leading: Icon(Icons.people, color: Colors.white),
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  trailing: Container(
                    width: SizeConfig.screenHeight * 0.04,
                    height: SizeConfig.screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExpanded1
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    ),
                  ),
                  children: Organisers.map((sponsor) => Text(
                        sponsor,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      )).toList(),
                  onExpansionChanged: (value) {
                    setState(
                      () {
                        isExpanded1 = !isExpanded1;
                      },
                    );
                  },
                ),
                ExpansionTile(
                  title: Text(
                    "Sponsers",
                    style: TextStyle(
                      fontSize: SizeConfig.baseFontSize * 5,
                    ),
                  ),
                  leading:
                      Icon(Icons.favorite_border_outlined, color: Colors.white),
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  trailing: Container(
                    width: SizeConfig.screenHeight * 0.04,
                    height: SizeConfig.screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExpanded2
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    ),
                  ),
                  children: Sponsor.map((sponsor) => Text(
                        sponsor,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      )).toList(),
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpanded2 = !isExpanded2;
                    });
                  },
                ),
                ExpansionTile(
                  key: expansionTileKey,
                  title: Text(
                    "Winners",
                    style: TextStyle(
                      fontSize: SizeConfig.baseFontSize * 5,
                    ),
                  ),
                  leading: Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  trailing: Container(
                    width: SizeConfig.screenHeight * 0.04,
                    height: SizeConfig.screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExpanded3
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    ),
                  ),
                  children: Winners.map((value) => Text(
                        value,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      )).toList(),
                  onExpansionChanged: (value) {
                    if (value) {
                      _scrollToSelectedContent(
                          expansionTileKey: expansionTileKey);
                    }
                    setState(() {
                      isExpanded3 = !isExpanded3;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
  final keyContext = expansionTileKey.currentContext;
  if (keyContext != null) {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scrollable.ensureVisible(keyContext,
          duration: Duration(milliseconds: 200));
    });
  }
}
