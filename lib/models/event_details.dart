import 'package:flutter/material.dart';

List<String> Organisers = [
  "Organiser 1",
  "Organiser 2",
  "Organiser 3",
  "Organiser 4",
];
List<String> Winners = [
  "Winner 1",
  "Winner 2",
  "Winner 3",
  "Winner 4",
  "Winner 5",
  "Winner 6",
  "Winner 7"
];
List<String> Sponsor = [
  "Sponsor 1",
  "Sponsor 2",
  "Sponsor 3",
  "Sponsor 4",
];

class ExpansionTileDetails {
  List<String> personType;
  String personTypeName;
  IconData icon;
  ExpansionTileDetails(
      {required this.personType,
      required this.personTypeName,
      required this.icon});
}

List<ExpansionTileDetails> personTypeList = [
  ExpansionTileDetails(
    personType: Organisers,
    personTypeName: "Organisers",
    icon: Icons.people,
  ),
  ExpansionTileDetails(
    personType: Sponsor,
    personTypeName: "Sponsors",
    icon: Icons.favorite_border_outlined,
  ),
  ExpansionTileDetails(
    personType: Winners,
    personTypeName: "Winners",
    icon: Icons.star_border,
  ),
];
