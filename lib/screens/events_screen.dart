import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/events_images.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
            child: Row(
              children: [
                Text(
                  "Events",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/mlsa-logo.png",
                  height: 50,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF219653), Color(0xFF792ADC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF219653), Color(0xFF792ADC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20, bottom: 20),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      child: Image.asset(
                          "assets/images/${eventsImages[index].image}"),
                    )),
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
        )),
      ),
    );
  }
}
