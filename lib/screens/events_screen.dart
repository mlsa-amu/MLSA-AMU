import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events_images.dart';

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
            padding: EdgeInsets.only(top: 20, bottom: 20),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      child: Image.asset(
                          "assets/images/${eventsImages[index].image}"),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventsImages[index].title,
                          style: TextStyle(color: Colors.white, fontSize: 24),
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
