import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events_images.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue.shade900,
            Color(0XFF792adc),
            Color(0XFF792adc),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Events",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical * 3,
              horizontal: SizeConfig.safeBlockHorizontal * 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockVertical * 3,
                ),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.dstATop,
                      ),
                      child: Image.asset(
                        "assets/images/${eventsImages[index].image}",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: SizeConfig.safeBlockVertical * 3,
                    left: SizeConfig.safeBlockHorizontal * 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventsImages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.baseFontSize * 6.6,
                          ),
                        ),
                        Text(
                          eventsImages[index].subTitle,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ]),
              );
            },
            itemCount: eventsImages.length,
          ),
        ),
      ),
    );
  }
}
