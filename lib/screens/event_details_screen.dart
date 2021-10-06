import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/event_details.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/expansion_tile.dart';

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
            margin: EdgeInsets.fromLTRB(0, SizeConfig.safeBlockVertical * 2.9,
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
              children: personTypeList
                  .map((e) => Expansion_Tile(
                        isExpanded: isExpanded1,
                        expansionTileDetails: e,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
