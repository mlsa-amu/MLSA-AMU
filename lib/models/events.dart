class Events {
  String? image;
  String? title;
  String? subTitle;
  String? about;
  String? startDate;
  String? endDate; 
  List? winners;
  List? organizers;
  List? sponsors;

  Events({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.about,
    required this.winners,
    required this.organizers,
    required this.sponsors,
    required this.startDate,
    required this.endDate,
  });
    Map toMap(Events event) {
    Map<String, dynamic> teamMap = Map<String, dynamic>();
    teamMap['title'] = event.title;
    teamMap['subtitle'] = event.subTitle;
    teamMap['about'] = event.about;
    teamMap['image'] = event.image;
    teamMap['winners'] = event.winners;
    teamMap['organizers'] = event.organizers;
    teamMap['sponsors'] = event.sponsors;
    teamMap['startDate'] = event.startDate;
    teamMap['endDate'] = event.endDate;
    return teamMap;
  }

  Events.fromMap(doc) {
    title = doc['title'];
    subTitle = doc['subtitle'];
    about = doc['about'];
    image = doc['image'];
    winners = doc['winners'];
    organizers = doc['organizers'];
    sponsors = doc['sponsors'];
    startDate = doc['startDate'];
    endDate = doc['endDate'];
  }
}


// const String staticAbout =
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ";
// List<Events> eventsImages = [
//   Events(
//     image: "hackathon.png",
//     title: "AMU Battlegrounds",
//     subTitle: "Global Hackathon",
//     about: staticAbout,
//   ),
//   Events(
//     image: "hacktober.png",
//     title: "Hacktoberfest 2021",
//     subTitle: "One contribution at a time",
//     about: staticAbout,
//   ),
//   Events(
//     image: "opensource.png",
//     title: "Introduction to Open Source",
//     subTitle: "How to make your first contribution?",
//     about: staticAbout,
//   ),
// ];
