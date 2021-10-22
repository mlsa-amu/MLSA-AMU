import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events.dart';
import 'package:mlsa_amu/screens/event_details_screen.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class EventCard extends StatelessWidget {
  final Events event;
  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsPage(
            event: event,
          ),
        ),
      ),
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
                child: Image.network(
                  event.image!,
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
                    event.title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.baseFontSize * 5.2,
                    ),
                  ),
                  Text(
                    event.subTitle!,
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
