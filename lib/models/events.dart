class EventsImagesModel {
  String image;
  String title;
  String subTitle;
  String about;

  EventsImagesModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.about,
  });
}

const String staticAbout =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ";
List<EventsImagesModel> eventsImages = [
  EventsImagesModel(
    image: "hackathon.png",
    title: "AMU Battlegrounds",
    subTitle: "Global Hackathon",
    about: staticAbout,
  ),
  EventsImagesModel(
    image: "hacktober.png",
    title: "Hacktoberfest 2021",
    subTitle: "One contribution at a time",
    about: staticAbout,
  ),
  EventsImagesModel(
    image: "opensource.png",
    title: "Introduction to Open Source",
    subTitle: "How to make your first contribution?",
    about: staticAbout,
  ),
];
