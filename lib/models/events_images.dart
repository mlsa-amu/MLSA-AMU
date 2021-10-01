class EventsImagesModel {
  String image;
  String title;
  String subTitle;

  EventsImagesModel({required this.image, required this.title, required this.subTitle});
}

List<EventsImagesModel> eventsImages = [
  EventsImagesModel(image: "hackathon.png", title: "AMU Battlegrounds", subTitle: "Global Hackathon"),
  EventsImagesModel(image: "hacktober.png", title: "Hacktoberfest 2021", subTitle: "one contribution at a time"),
  EventsImagesModel(image: "opensource.png", title: "Introduction to Open Source", subTitle: "How to make your first contribution?"),
];
