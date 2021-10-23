import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/utils/size_config.dart';
import 'package:mlsa_amu/widgets/expansion_tile.dart';

class EventDetailsPage extends StatefulWidget {
  final EventsModel event;
  EventDetailsPage({required this.event});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  bool isExpanded1 = false, isExpanded2 = false, isExpanded3 = false;
  final GlobalKey expansionTileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 5,
                bottom: SizeConfig.safeBlockVertical * 3,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(),
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
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.baseFontSize * 5,
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
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 4,
                bottom: SizeConfig.safeBlockHorizontal * 6.5,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.calendarAlt,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      DateFormat.yMMMd()
                              .format(widget.event.startDate!)
                              .toString() +
                          " - " +
                          DateFormat.yMMMd()
                              .format(widget.event.endDate!)
                              .toString(),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.baseFontSize * 4.5,
                      ),
                    ),
                  ),
                ],
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
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockVertical * 1.5,
              ),
              child: Text(
                "About",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.baseFontSize * 5.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockVertical * 1.5,
              ),
              child: Text(
                widget.event.about!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.baseFontSize * 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
