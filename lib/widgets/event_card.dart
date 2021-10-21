import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/screens/event_details_screen.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class EventCard extends StatelessWidget {
  final int index;
  EventCard(this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EventDetailsPage(
                    index: index,
                  ))),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 4,
          vertical: SizeConfig.safeBlockVertical * 1,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  "assets/images/${eventsImages[index].image}",
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.safeBlockVertical * 2,
              right: SizeConfig.safeBlockHorizontal * 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Oct',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.baseFontSize * 5.2,
                      ),
                    ),
                    Text(
                      '2021',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.baseFontSize * 3,
                      ),
                    )
                  ],
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
                    eventsImages[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.baseFontSize * 5.2,
                    ),
                  ),
                  Text(
                    eventsImages[index].subTitle,
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
    );
  }
}
