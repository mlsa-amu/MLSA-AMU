import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/expansion_tile.dart';

class EventDetailsPage extends StatefulWidget {
  final Events event;
  EventDetailsPage({required this.event});

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
                    child: Image.network(
                      widget.event.image!,
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
                        widget.event.title!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.baseFontSize * 5.2,
                        ),
                      ),
                      Text(
                        widget.event.subTitle!,
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
              widget.event.startDate! + " - " + widget.event.endDate!,
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
                widget.event.organizers!,
                widget.event.sponsors!,
                widget.event.winners!
              ]
                  .map(
                    (e) => e.isNotEmpty
                        ? Expansion(
                            isExpanded: isExpanded1,
                            expansionTileDetails: e,
                            index: [
                              widget.event.organizers!,
                              widget.event.sponsors!,
                              widget.event.winners!
                            ].indexOf(e),
                          )
                        : SizedBox(),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.safeBlockHorizontal * 4.2,
                SizeConfig.safeBlockVertical * 1.5,
                SizeConfig.safeBlockHorizontal * 4.2,
                SizeConfig.safeBlockVertical * 1.6),
            child: Text(
              "About",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.baseFontSize * 6,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.safeBlockHorizontal * 4.2,
                SizeConfig.safeBlockVertical * 1.3,
                SizeConfig.safeBlockHorizontal * 4.2,
                SizeConfig.safeBlockVertical * 1.6),
            child: Text(
              widget.event.about!,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.baseFontSize * 4.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
